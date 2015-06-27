package com.huixinpn.dionysus.domain.psychtest;


public enum PsychTestType {

	PF16 {
		@Override
		public String toString() {
			return "16PF";
		}
	},
	
	// 艾森克人格问卷（ Eysenck Personality Questionnaire,EPQ）
	EPQ {
		@Override
		public String toString() {
			return "EPQ";
		}
	},
	
	// 明尼苏达多项人格问卷（MMPI: Minnesota Multiphasic Personality Inventory）
	MMPI {
		@Override
		public String toString() {
			return "MMPI";
		}
	},
	
	// 爱德华个人偏好测验（Edwards Personal Preference Schedule）
	EPPS {
		@Override
		public String toString() {
			// TODO Auto-generated method stub
			return "EPPS";
		}
	},
	
	// 主题统觉测验Thematic ApperceptionTest
	TAT {
		@Override
		public String toString() {
			return "TAT";
		}
	}
}
