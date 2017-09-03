package com.controller;

import com.dao.CompanyMapper;
import com.enums.ReturnEnum;
import com.google.common.collect.Maps;
import com.model.Company;
import com.result.BaseResult;
import com.utils.PhoneUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/ac/company")
public class CompanyController extends  BaseController{

	@Autowired
	private CompanyMapper companyMapper;

	@RequestMapping("/detail")
	public String detail(Map modelMap, Integer id){

		try{
			Company company = companyMapper.selectByPrimaryKey(id);
			modelMap = BaseResult.makeResut(company).toMap();
			System.out.print(modelMap);
			System.out.print("---");
		}catch (Exception e){
			Logger.getLogger(this.getClass().getName()).error(String.format("getCompanyInfo error!"),e);
		}

		return "/detail";

	}

	@RequestMapping("/info/complete")
	public @ResponseBody Map complete(@ModelAttribute Company company){
		Map errorMap = Maps.newHashMap();
		try{
			validForm(errorMap,company);
			companyMapper.insert(company);
		}catch (DuplicateKeyException e){
			Logger.getLogger(this.getClass().getName()).error(String.format("createCompany DuplicateKeyException error!"),e);
			BaseResult.makeErrorResut(ReturnEnum.UK_ERROR,null).toMap();
		}catch (IllegalArgumentException iae){
			Logger.getLogger(this.getClass().getName()).error(String.format("createCompany IllegalArgumentException error!"),iae);
			BaseResult.makeErrorResut(ReturnEnum.PARAMS_ERROR,null,errorMap).toMap();
		}catch (Exception e){
			Logger.getLogger(this.getClass().getName()).error(String.format("createCompany error!"),e);
			BaseResult.makeErrorResut(ReturnEnum.SERVER_ERROR,e.toString()).toMap();
		}
		// return "redirect:/info?id"+company.getId();
		return BaseResult.makeResut().toMap();
	}

	@RequestMapping("/register")
	public @ResponseBody Map register(String tel, String messageValidCode, String password, String bizType){
		Map errorMap = Maps.newHashMap();
		try{
			if(StringUtils.isEmpty(tel)){
				errorMap.put("tel","电话号码为空！");
			}
			if(StringUtils.isEmpty(password)){
				errorMap.put("password","密码为空！");
			}
			if(StringUtils.isEmpty(messageValidCode)){
				errorMap.put("messageValidCode","验证码为空！");
			}
			if(PhoneUtils.isPhone(tel)){
				String cachedMessageValidCode = messageSupport.getMessageValidCode(tel, bizType);
				if(StringUtils.isEmpty(cachedMessageValidCode) || !messageValidCode.equals(cachedMessageValidCode)){
					errorMap.put("messageValidCode","验证码不正确，请重新获取！");
				}
			}else{
				errorMap.put("messageValidCode","电话号码格式错误！");
			}
			Company company = new Company();
			company.setTel(tel);
			company.setUserName(tel);
			company.setPassword(password);
			//TODO 剩余字段需要补齐

			companyMapper.insert(company);
			BaseResult.makeResut(company).toMap();
		}catch (DuplicateKeyException e){
			Logger.getLogger(this.getClass().getName()).error(String.format("createCompany DuplicateKeyException error!"),e);
			BaseResult.makeErrorResut(ReturnEnum.UK_ERROR,null).toMap();
		}catch (IllegalArgumentException iae){
			Logger.getLogger(this.getClass().getName()).error(String.format("createCompany IllegalArgumentException error!"),iae);
			BaseResult.makeErrorResut(ReturnEnum.PARAMS_ERROR,null,errorMap).toMap();
		}catch (Exception e){
			Logger.getLogger(this.getClass().getName()).error(String.format("createCompany error!"),e);
			BaseResult.makeErrorResut(ReturnEnum.SERVER_ERROR,e.toString()).toMap();
		}
		return BaseResult.makeResut().toMap();
	}

	@RequestMapping("/generateMessageValidCode")
	public @ResponseBody Map generateMessageValidCode(String tel, String bizType){
		String messageValidCode = null;
		try{

			boolean isPhone = PhoneUtils.isPhone(tel);
			if(isPhone){
				messageValidCode = messageSupport.generateMessageValidCode(tel, bizType);
			}else{
				Map errorMap = Maps.newHashMap();
				errorMap.put("tel","电话号码格式错误！");
				BaseResult.makeErrorResut(ReturnEnum.PARAMS_ERROR,null,errorMap).toMap();
			}

		}catch (Exception e){
			Logger.getLogger(this.getClass().getName()).error(String.format("generateMessageValidCode error!"),e);
			BaseResult.makeErrorResut(ReturnEnum.REMOTE_SERVICE_ERROR,"调用云服务异常").toMap();
		}

		return BaseResult.makeResut(messageValidCode).toMap();
	}




}
