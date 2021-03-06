package com.doglovers.abandog.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.doglovers.abandog.dto.DogDTO;
import com.doglovers.abandog.dto.DogImgDTO;
import com.doglovers.abandog.dto.Pagination;

public interface DogDAOImg {
	/*
	int selectDogListNum();
	int selectDogListNum2(Pagination pagination);
	*/
	//int selectDogListImg2(Pagination pagination);
	ArrayList<DogDTO> selectDogList(Pagination pagination);
	DogDTO selectDog(int cid);
	ArrayList<DogDTO> selectDogList_cids(DogImgDTO temp);
}
