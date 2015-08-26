package com.huixinpn.dionysus.domain.psychtest.eval;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestionOption;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

public class OLSONEvaluationStrategy implements PsychTestEvaluationStrategy {
	private static final Map<String, List<Integer>> RAW_SPLIT = prepareMap();
	private static final List<Integer> a1 = Arrays.asList(34, 42, 64, 70, 101, 116, 117, 118, 119, 120, 121, 122, 123, 124);
	private static final List<Integer> a2 = Arrays.asList(14, 19, 32, 36, 52, 53, 82, 88, 99, 113);
	private static final List<Integer> a3 = Arrays.asList(8, 13, 24, 30, 37, 44, 63, 78, 95, 115);
	private static final List<Integer> a4 = Arrays.asList(2, 6, 40, 54, 66, 73, 81, 91, 98, 109);
	private static final List<Integer> a5 = Arrays.asList(4, 10, 39, 58, 71, 74, 79, 83, 96, 112);
	private static final List<Integer> a6 = Arrays.asList(16, 20, 26, 38, 45, 51, 77, 85, 93, 110);
	private static final List<Integer> a7 = Arrays.asList(1, 17, 18, 28, 31, 33, 60, 72, 84, 114);
	private static final List<Integer> a8 = Arrays.asList(9, 15, 25, 41, 47, 62, 69, 106, 107, 111);
	private static final List<Integer> a9 = Arrays.asList(5, 21, 35, 49, 50, 59, 67, 87, 94, 102);
	private static final List<Integer> a10 = Arrays.asList(7, 27, 48, 57, 68, 86, 90, 92, 103, 108);
	private static final List<Integer> a11 = Arrays.asList(12, 23, 29, 43, 55, 61, 75, 80, 97, 105);
	private static final List<Integer> a12 = Arrays.asList(3, 11, 22, 46, 56, 65, 76, 89, 100, 104);
	
	private static Map<String, List<Integer>> prepareMap() {
        Map<String, List<Integer>> hashMap = new HashMap<>();
       
        hashMap.put("过份理想化", a1);
        hashMap.put("婚姻满意度", a2);
        hashMap.put("性格相容性", a3);
        hashMap.put("夫妻交流", a4);
        hashMap.put("解决冲突的方式", a5);
        hashMap.put("经济安排", a6);
        hashMap.put("业余活动", a7);
        hashMap.put("性生活", a8);
        hashMap.put("子女和婚姻", a9);
        hashMap.put("与亲友的关系", a10);
        hashMap.put("角色平等性", a11);
        hashMap.put("信仰一致性", a12);
        
        return hashMap;
    }
	
	public void calculateScore(Integer subid, String identity, Map<String, Integer> scores) {
		int value;
		for (Map.Entry<String, List<Integer>> entry : RAW_SPLIT.entrySet())
		{
		    for (Integer i: entry.getValue())
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
					case "E":
						value = 5;
						break;
					default: 
						value = 0;
						break;
		    		}
		    		if (scores.containsKey(entry.getKey()))	{
						scores.put(entry.getKey(), scores.get(entry.getKey()) + value);
					} else {
						scores.put(entry.getKey(), value);
					}
		    	}
		    }
		}						
	}
	
	class OLSOVisitor extends PsychTestValueVisitorAdaptor {
		private Map<String, Integer> scores = new HashMap<String, Integer>();
		private OLSONEvaluationStrategy strategy;

		public OLSOVisitor(OLSONEvaluationStrategy strategy) {
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
		OLSOVisitor visitor = new OLSOVisitor(this);
		result.accept(visitor);
		return visitor.getScore();
	}
}
