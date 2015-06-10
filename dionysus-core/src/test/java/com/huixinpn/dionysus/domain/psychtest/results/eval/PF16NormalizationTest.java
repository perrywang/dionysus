package com.huixinpn.dionysus.domain.psychtest.results.eval;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;

import com.huixinpn.dionysus.domain.psychtest.results.eval.PF16Normalization.Range;

public class PF16NormalizationTest {

	
	// 高中女生十六种个性因素常模
//	因素  1    2  3    4    5    6      7      8      9     10
//	A   0-1  2  3-5  6-7  8-9  10-12  13-14  15-16  17-19  20
	@Test
	public void testHighSchoolGirlFactorANormalization() {
		Map<String, List<Range>> mapping = PF16Normalization.createNormalizeMap(PF16Normalization.HIGH_SCHOOL_GIRL);
		Assert.assertEquals(mapping.size(), 16);
		String factor = "A";

		List<Range> ranges = mapping.get(factor);
		Assert.assertEquals(ranges.size(), 10);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 0, factor), 1);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 1, factor), 1);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 2, factor), 2);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 3, factor), 3);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 4, factor), 3);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 5, factor), 3);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 6, factor), 4);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 7, factor), 4);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 8, factor), 5);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 9, factor), 5);

		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 10, factor), 6);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 11, factor), 6);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 12, factor), 6);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 13, factor), 7);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 14, factor), 7);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 15, factor), 8);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 16, factor), 8);

		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 17, factor), 9);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 18, factor), 9);
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 19, factor), 9);
		
		Assert.assertEquals(PF16Normalization.normalizeScore(ranges, 20, factor), 10);
	}

}
