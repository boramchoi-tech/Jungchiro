package com.jungchiro.poli.news.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.news.dto.NewsMongoDto;




@Repository
public class NewsMongoDao {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public List<NewsMongoDto> findAll(){
		
		List<NewsMongoDto> list = mongoTemplate.findAll(NewsMongoDto.class, "news");
		
		return list;		
		
	}
	
	public List<NewsMongoDto> find_h(){

		Query query =new Query(new Criteria("type").all("h")); 
		List<NewsMongoDto> list = mongoTemplate.find(query, NewsMongoDto.class, "news");
		
		return list;		
		
	}

	public List<NewsMongoDto> find_d(){

		Query query =new Query(new Criteria("type").all("d")); 
		List<NewsMongoDto> list = mongoTemplate.find(query, NewsMongoDto.class, "news");
		
		return list;		
		
	}

	public List<NewsMongoDto> find_j(){

		Query query =new Query(new Criteria("type").all("j")); 
		List<NewsMongoDto> list = mongoTemplate.find(query, NewsMongoDto.class, "news");
		
		return list;		
		
	}


}
