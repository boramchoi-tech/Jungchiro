package com.jungchiro.poli.map.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.map.model.dto.PollsDto;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;


@Repository
public class PollsDao {

	//private MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
	
	//private MongoTemplate mongoTemplate = new MongoTemplate(mongoClient, "final");
	
	/*
	public List<PollsDto> findByLocationNear(){
		double lat = 126.8622572;
		double longt = 37.50989181;
		double maxlength = 2/6378.1; //변수로 안넣고 query에 바로 넣으면 invalid json number 오류남
		BasicQuery query1 = new BasicQuery("{location:{ $geoWithin: {  $centerSphere: [["+ lat +","+ longt+"], "+ maxlength +" ] } } }");

        List<PollsDto> list = mongoTemplate.find(query1, PollsDto.class,"polls");
	         
		return list;
	}
	*/
}
