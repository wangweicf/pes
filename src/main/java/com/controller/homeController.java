package com.controller;


import com.dao.CompanyMapper;
import com.model.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/")
public class homeController {

	@Autowired
	private CompanyMapper companyMapper;

	@RequestMapping("/")
	public String index(ModelMap modelMap){
		Company company = companyMapper.selectByPrimaryKey(1);
		System.out.print(company);
		System.out.print("---");
		return "/kk";
	}

    @RequestMapping("/create")
    public String create(ModelMap modelMap, Company company){

        company.setAddress("adress");
        //company.set

        System.out.print(company);
        System.out.print("---");
        return "/kk";
    }

}
