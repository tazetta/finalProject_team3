package com.spring.main.dao;

import java.util.HashMap;

public interface MemberDAO {

	String login(String id);

	int overlay(HashMap<String, String> params);

	int join(HashMap<String, String> params);



}
