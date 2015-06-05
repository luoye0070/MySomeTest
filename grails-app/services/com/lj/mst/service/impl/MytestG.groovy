package com.lj.mst.service.impl

import com.lj.mst.data.TestData
import com.lj.mst.service.TestInterface;

class MytestG implements TestInterface {

	@Override
	public TestData getFirstTestData() {
		TestData testData=TestData.first();
		return testData;
	}

}
