package com.huixinpn.dionysus.domain.psychtest.eval;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huixinpn.dionysus.domain.psychtest.PsychTestQuestion;
import com.huixinpn.dionysus.domain.psychtest.PsychTestResult;

// 艾森克量表
public class EPQEvaluationStrategy implements PsychTestEvaluationStrategy {

	private static final List<Integer> a1 = Arrays.asList(2, 6, 9, 11, 18, 22, 26, 30, 34, 38, 42, 46, 50, 56, 62, 66, 68, 72, 75, 76, 81, 85, 88);
	private static final List<Integer> a2 = Arrays.asList(1, 5, 10, 13, 14, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 55, 61, 65, 71, 80, 84);
	private static final List<Integer> a3 = Arrays.asList(3, 7, 12, 15, 19, 23, 27, 31, 35, 39, 43, 47, 51, 57, 59, 63, 67, 69, 73, 74, 77, 78, 82, 86);
	private static final List<Integer> a4 = Arrays.asList(4, 8, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 54, 58, 60, 64, 70, 79, 83, 87);
	
	private static final List<Integer> negative_question = Arrays.asList(2, 6, 9, 11, 18, 38, 42, 56, 62, 72, 88,
			21, 29, 45, 4, 8, 16, 24, 28, 40, 44, 48, 52, 54, 60, 64, 70, 79, 83);

    private Map<String, List<Integer>> RAW_SPLIT = prepareMap();
	
	private static Map<String, List<Integer>> prepareMap() {
        Map<String, List<Integer>> hashMap = new HashMap<>();
       
        hashMap.put("P", a1);
        hashMap.put("E", a2);
        hashMap.put("N", a3);
        hashMap.put("L", a4);
        
        return hashMap;
    }
	
	public void calculateScore(Integer subid, boolean yesno, Map<String, Integer> scores) {
		int value = 0;
		for (Map.Entry<String, List<Integer>> entry : RAW_SPLIT.entrySet())
		{
		    for (Integer i : entry.getValue())
		    {
		    	if(i.equals(subid)){
		    		/****判断正性和负性***********/
		    		for(Integer j : negative_question){
			    		if(j.equals(subid)){
			    			// 负性题，回答“是“时，就在答题卡内写“1”；回答“否“时就在答题卡内写上打“2”
			    			value = yesno ? 1 : 2;
			    		}else{
			    			// 正性题，回答“是“时，就在答题卡内写“2”；回答“否“时就在答题卡内写上打“1”
			    			value = yesno ? 2 : 1;
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
	}
	
	class EPQVisitor extends PsychTestValueVisitorAdaptor {
		private Map<String, Integer> scores = new HashMap<String, Integer>();
		private EPQEvaluationStrategy strategy;

		public EPQVisitor(EPQEvaluationStrategy strategy) {
			this.strategy = strategy;
		}
		@Override
		public void accept(PsychTestQuestion question, boolean yesno) {
			Integer subid = question.getSubId();
			strategy.calculateScore(subid, yesno, scores);
		}

		public Map<String, Integer> getScore() {
			return this.scores;
		}
	}

	@Override
	public Object evaluate(PsychTestResult result) {
		EPQVisitor visitor = new EPQVisitor(this);
		result.accept(visitor);
		return visitor.getScore();
	}

}
