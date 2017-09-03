package com.model;

import java.util.Date;

public class CompanyAddress {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company_address.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company_address.address
     *
     * @mbg.generated
     */
    private String address;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company_address.is_default
     *
     * @mbg.generated
     */
    private Integer isDefault;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company_address.created_at
     *
     * @mbg.generated
     */
    private Date createdAt;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column company_address.company_id
     *
     * @mbg.generated
     */
    private Integer companyId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company_address.id
     *
     * @return the value of company_address.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company_address.id
     *
     * @param id the value for company_address.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company_address.address
     *
     * @return the value of company_address.address
     *
     * @mbg.generated
     */
    public String getAddress() {
        return address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company_address.address
     *
     * @param address the value for company_address.address
     *
     * @mbg.generated
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company_address.is_default
     *
     * @return the value of company_address.is_default
     *
     * @mbg.generated
     */
    public Integer getIsDefault() {
        return isDefault;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company_address.is_default
     *
     * @param isDefault the value for company_address.is_default
     *
     * @mbg.generated
     */
    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company_address.created_at
     *
     * @return the value of company_address.created_at
     *
     * @mbg.generated
     */
    public Date getCreatedAt() {
        return createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company_address.created_at
     *
     * @param createdAt the value for company_address.created_at
     *
     * @mbg.generated
     */
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column company_address.company_id
     *
     * @return the value of company_address.company_id
     *
     * @mbg.generated
     */
    public Integer getCompanyId() {
        return companyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column company_address.company_id
     *
     * @param companyId the value for company_address.company_id
     *
     * @mbg.generated
     */
    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}