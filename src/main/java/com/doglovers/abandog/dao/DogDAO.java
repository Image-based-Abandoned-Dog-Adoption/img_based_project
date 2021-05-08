package com.doglovers.abandog.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.doglovers.abandog.dto.DogDTO;
import com.doglovers.abandog.dto.Pagination;
import com.doglovers.abandog.dto.SaveDogDTO;

public interface DogDAO {
	int selectDogListNum();
	int selectDogListNum2(Pagination pagination);
	ArrayList<DogDTO> selectDogList(Pagination pagination);
	DogDTO selectDog(int cid);
	ArrayList<DogDTO> selectMyDogList(int uid);
	ArrayList<DogDTO> selectMyDogList2(Pagination pagination);
	int selectMyDogListNum(int uid);
	int insertDog(SaveDogDTO dto);
	int duplicateDog(SaveDogDTO dto);
	ArrayList<DogDTO> selectDogKind();
	ArrayList<DogDTO> selectDogAge();
}
