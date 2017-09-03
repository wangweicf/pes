package com.model;

import java.util.Date;

public class TraceLog {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column trace_log.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column trace_log.trace_type
     *
     * @mbg.generated
     */
    private String traceType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column trace_log.action_date
     *
     * @mbg.generated
     */
    private Date actionDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column trace_log.user_id
     *
     * @mbg.generated
     */
    private Integer userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column trace_log.user_type
     *
     * @mbg.generated
     */
    private String userType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column trace_log.content
     *
     * @mbg.generated
     */
    private String content;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column trace_log.id
     *
     * @return the value of trace_log.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column trace_log.id
     *
     * @param id the value for trace_log.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column trace_log.trace_type
     *
     * @return the value of trace_log.trace_type
     *
     * @mbg.generated
     */
    public String getTraceType() {
        return traceType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column trace_log.trace_type
     *
     * @param traceType the value for trace_log.trace_type
     *
     * @mbg.generated
     */
    public void setTraceType(String traceType) {
        this.traceType = traceType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column trace_log.action_date
     *
     * @return the value of trace_log.action_date
     *
     * @mbg.generated
     */
    public Date getActionDate() {
        return actionDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column trace_log.action_date
     *
     * @param actionDate the value for trace_log.action_date
     *
     * @mbg.generated
     */
    public void setActionDate(Date actionDate) {
        this.actionDate = actionDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column trace_log.user_id
     *
     * @return the value of trace_log.user_id
     *
     * @mbg.generated
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column trace_log.user_id
     *
     * @param userId the value for trace_log.user_id
     *
     * @mbg.generated
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column trace_log.user_type
     *
     * @return the value of trace_log.user_type
     *
     * @mbg.generated
     */
    public String getUserType() {
        return userType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column trace_log.user_type
     *
     * @param userType the value for trace_log.user_type
     *
     * @mbg.generated
     */
    public void setUserType(String userType) {
        this.userType = userType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column trace_log.content
     *
     * @return the value of trace_log.content
     *
     * @mbg.generated
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column trace_log.content
     *
     * @param content the value for trace_log.content
     *
     * @mbg.generated
     */
    public void setContent(String content) {
        this.content = content;
    }
}