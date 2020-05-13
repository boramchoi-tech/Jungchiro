package com.jungchiro.poli.map.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.map.model.dto.PollsDto;


@Repository
public class PollsDao {

	@Autowired
	private MongoTemplate mongoTemplate;

	
	//내 주변 5km이내 투표소 리스트
	public List<PollsDto> findByLocationNear(double lat, double lng){

		double maxlength = 5/6378.1; //변수로 안넣고 query에 바로 넣으면 invalid json number 오류남
		BasicQuery query1 = new BasicQuery("{location:{ $geoWithin: {  $centerSphere: [["+ lat +","+ lng+"], "+ maxlength +" ] } } }");

        List<PollsDto> list = mongoTemplate.find(query1, PollsDto.class,"polls");
	         
		return list;
	}
	
}
