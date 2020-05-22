package com.jungchiro.poli.bill.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jungchiro.poli.bill.model.dto.BillDto;
import com.jungchiro.poli.board.model.dto.PagingDto;

@Repository
public class BillDaoImpl implements BillDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BillDto> billList(PagingDto page) {
		// TODO Auto-generated method stub
		List<BillDto> list = null;
		try {

			list = sqlSession.selectList(NAMESPACE + "billList", page);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error(billList):3,4");

		}
		return list;
	}

	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "listCount");
	}

}
