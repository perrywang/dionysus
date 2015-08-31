package com.huixinpn.dionysus.domain.psychtest.eval;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

public class SCL90EvaluationStrategy implements PsychTestEvaluationStrategy {

	private static final List<Integer> a1 = Arrays.asList(1, 4, 12, 27, 40, 42, 48, 49, 52, 53, 56, 58);
	private static final List<Integer> a2 = Arrays.asList(3, 9, 10, 28, 38, 45, 46, 51, 55, 65);
	private static final List<Integer> a3 = Arrays.asList(6, 21, 34, 36, 37, 41, 61, 69, 73);
	private static final List<Integer> a4 = Arrays.asList(5, 14, 15, 20, 22, 26, 29, 30, 31, 32, 54, 71, 79);
	private static final List<Integer> a5 = Arrays.asList(2, 17, 23, 33, 39, 57, 72, 78, 80, 86);
	private static final List<Integer> a6 = Arrays.asList(11, 24, 63, 67, 74, 81);
	private static final List<Integer> a7 = Arrays.asList(13, 25, 47, 50, 70, 75, 82);
	private static final List<Integer> a8 = Arrays.asList(8, 18, 43, 68, 76, 83);
	private static final List<Integer> a9 = Arrays.asList(7, 16, 35, 62, 77, 84, 85, 87, 88, 90);
	private static final List<Integer> a10 = Arrays.asList(19, 44, 59, 60, 64, 66, 89);
	
	private Map<String, List<Integer>> RAW_SPLIT = prepareMap();
	
	private static Map<String, List<Integer>> prepareMap() {
        Map<String, List<Integer>> hashMap = new HashMap<>();
       
        hashMap.put("躯体化", a1);
        hashMap.put("强迫症状", a2);
        hashMap.put("人际关系敏感", a3);
        hashMap.put("抑郁", a4);
        hashMap.put("焦虑", a5);
        hashMap.put("敌对", a6);
        hashMap.put("恐怖", a7);
        hashMap.put("偏执", a8);
        hashMap.put("精神病性", a9);
        hashMap.put("其它项目", a10);
        
        return hashMap;
    }
	
	public void calculateScore(Integer subid, String identity, Map<String, Integer> scores) {
		int value = 0;
		for (Map.Entry<String, List<Integer>> entry : RAW_SPLIT.entrySet())
		{
		    for (Integer i : entry.getValue())
		    {
		    	if(i.equals(subid)){
		    		switch(identity){
						case "A":
							value = 1;
							break;
						case "B":
							value = 2;
							break;
						case "C":
							value = 3;
							break;
						case "D":
							value = 4;
							break;
						case "E":
							value = 5;
							break;
						default: 
							value = 0;
							break;
			    	}    		
		    	}
		    	if (scores.containsKey(entry.getKey()))	{
					scores.put(entry.getKey(), scores.get(entry.getKey()) + value);
				} else {
					scores.put(entry.getKey(), value);
				}	    				    	
		    }
		}						
	}
	
	class SCL90Visitor extends PsychTestValueVisitorAdaptor {
		private Map<String, Integer> scores = new HashMap<String, Integer>();
		private SCL90EvaluationStrategy strategy;

		public SCL90Visitor(SCL90EvaluationStrategy strategy) {
			this.strategy = strategy;
		}
		
		@Override
		public void accept(PsychTestQuestion question, PsychTestQuestionOption option) {
			Integer subid = question.getSubId();		
			String identity = option.getIdentity();
			strategy.calculateScore(subid, identity, scores);		
		}

		public Map<String, Integer> getScore() {
			return this.scores;
		}
	}
	@Override
	public Object evaluate(PsychTestResult result) {
		SCL90Visitor visitor = new SCL90Visitor(this);
		result.accept(visitor);
		return visitor.getScore();
	}

}
