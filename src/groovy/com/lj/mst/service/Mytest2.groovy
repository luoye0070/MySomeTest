package com.lj.mst.service

import com.lj.mst.data.TestData

class Mytest2 implements TestInterface {

	@Override
	public TestData getFirstTestData() {
		TestData testData=TestData.last();
		return testData;
	}

}
