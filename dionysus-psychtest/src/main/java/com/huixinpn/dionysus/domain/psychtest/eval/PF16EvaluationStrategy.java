package com.huixinpn.dionysus.domain.psychtest.eval;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

public class PF16EvaluationStrategy implements PsychTestEvaluationStrategy {

	// 卡特尔16PF测验计分健
	private static final String[] RAW_ANSWERS = new String[] {
		"A 3ab,26bc,27bc,51bc,52ab,76bc,101ab,126ab,151bc,176ab",
		"B 28b,53b,54b,77c,78b,102c,103b,127c,128b,152b,153c,177a,178a",
		"C 4ab,5bc,29bc,30ab,55ab,79bc,80bc,104ab,105ab,129ab,130ab,154bc,179ab",
		"E 6bc,7ab,31bc,32bc,56ab,57bc,81bc,106bc,131ab,155ab,156ab,180ab,181ab",
		"F 8bc,33ab,58ab,82bc,83bc,107bc,108bc,132ab,133ab,157bc,158bc,182ab,183ab",
		"G 9bc,34bc,59ab,84bc,109ab,134ab,159bc,160ab,184ab,185ab",
		"H 10ab,35bc,36ab,60bc,61bc,85bc,86bc,110ab,111ab,135bc,136ab,161bc,186ab",
		"I 11bc,12bc,37ab,62bc,87bc,112ab,137bc,138ab,162bc,163ab",
		"L 13ab,38ab,63bc,64bc,88ab,89bc,113ab,114ab,139bc,164ab",
		"M 14bc,15bc,39ab,40ab,65ab,90bc,91ab,115ab,116bc,140ab,141bc,165bc,166bc",
		"N 16bc,17ab,41bc,42ab,66bc,67bc,92bc,117ab,142ab,167ab",
		"O 18ab,19bc,43ab,44bc,68bc,69ab,93bc,94bc,118ab,119ab,143ab,144bc,168ab",
		"Q1  20ab,21ab,45bc,46ab,70ab,95bc,120bc,145ab,169ab,170bc",
		"Q2  22bc,47ab,71ab,72ab,96bc,97bc,121bc,122bc,146ab,171ab",
		"Q3  23bc,23bc,48ab,73ab,98ab,123bc,147ab,148ab,172bc,173ab",
		"Q4  25ab,49ab,50ab,74ab,75bc,99ab,100bc,124ab,125bc,149ab,150ab,174ab,175bc"
	};
	
	private Map<Integer, Answer> answers = new HashMap<Integer, Answer>();
	
	public PF16EvaluationStrategy() {
		Pattern pattern = Pattern.compile("(\\d+)([abc]+)");
		
		for (String line : RAW_ANSWERS) {
			String[] row = line.split("\\s+");
			String factor = row[0];
			String rawAnswer = row[1];
			Matcher matcher = pattern.matcher(rawAnswer);
			while(matcher.find()) {
				Integer num = Integer.parseInt(matcher.group(1));
				String values = matcher.group(2);
				answers.put(num, new Answer(factor, values));
			}
		}
	}
	
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	static class Answer {
		private String factor;
		private String values;
		
		// 不是所有的题目均有计分
		public static Answer nullObject = new Answer() {
			@Override
			public int calculateScore(String rawAnswer) {
				return 0;
			};
		};
		
		public int calculateScore(String rawAnswer) {
			// 所有答案均为小写
			String answer = rawAnswer.toLowerCase();

			// 聪慧性（因素B）量表的题目有正确答案，每题答对1分，不对0分
			if ("B".equals(this.factor)) {
				return values.equals(answer) ? 1 : 0;
			}

			// 包含计分项目
			if (values.contains(answer)) {
				// 除B因素只计1分外，其他因素均为a、c计2分、b计1分
				return "b".equals(answer) ? 1 : 2;
			}
			return 0;
		}
	}
	
	public Answer requestAnswer(int index) {
		Answer answer = answers.get(index);
		return answer == null ? Answer.nullObject : answer;
	}
	
	class PF16Visitor extends PsychTestValueVisitorAdaptor {
		private Map<String, Integer> scores = new HashMap<String, Integer>();
		private PF16EvaluationStrategy strategy;

		public PF16Visitor(PF16EvaluationStrategy strategy) {
			this.strategy = strategy;
		}

		@Override
		public void accept(PsychTestQuestion question, PsychTestQuestionOption option) {
			Integer subid = question.getSubId();
			Answer answer = strategy.requestAnswer(subid);
			String factor = answer.getFactor();
			if (factor != null) {
				String identity = option.getIdentity();
				int score = answer.calculateScore(identity);
				if (scores.containsKey(factor))	{
					scores.put(factor, scores.get(factor) + score);
				} else {
					scores.put(factor, score);
				}
			}
		}
		
		public Map<String, Integer> getScore() {
			return this.scores;
		}
		
		public Map<String, Integer> getNormalizedScore(String[] mode) {
			Map<String, Integer> scores = this.getScore();
			// TODO: 判断用户身份，选择对应的常模
			return PF16Normalization.normalize(scores, PF16Normalization.ADULT_MALE);
		}
	}

	@Override
	public Object evaluate(PsychTestResult result) {
		PF16Visitor visitor = new PF16Visitor(this);
		result.accept(visitor);
		return visitor.getScore();
	}
}
