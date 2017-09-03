package com.controller;

import com.support.MessageSupport;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.Map;
import java.util.Set;

public  class BaseController {

	@Autowired
	public MessageSupport messageSupport;

	@Autowired
	private Validator validator;

	public void validForm(Map map, Object target){
		Set<ConstraintViolation<Object>> constraintViolations = validator.validate(target, null);
		if (!constraintViolations.isEmpty()) {
			StringBuffer sb=new StringBuffer();
			for (ConstraintViolation constraintViolation : constraintViolations) {
				constraintViolation.getInvalidValue();
				sb.append(constraintViolation.getMessage());
			}
			throw new IllegalArgumentException(sb.toString());
		}
	}

}
