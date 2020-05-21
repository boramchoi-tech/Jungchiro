package com.jungchiro.poli.bill.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jungchiro.poli.bill.model.dao.BillDao;
import com.jungchiro.poli.bill.model.dto.BillDto;
import com.jungchiro.poli.board.model.dto.PagingDto;

@Service
public class BillBizImpl implements BillBiz {

	@Autowired
	private BillDao dao;

	@Override
	public List<BillDto> billList(PagingDto page) {
		// TODO Auto-generated method stub
		return dao.billList(page);
	}

	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return dao.listCount();
	}



}
