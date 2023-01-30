package com.patinshop.dao;

import java.util.Date;
import java.util.List;

public interface ReportDAO {

	List<Object[]> inventory();

	List<Object[]> revenueByCategory();

	List<Object[]> revenueByCustomer();

	List<Object[]> revenueByMonths(Date fromDate, Date toDate);

}
