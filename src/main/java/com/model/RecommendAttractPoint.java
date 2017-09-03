package com.model;

import java.util.Date;

public class RecommendAttractPoint {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend_attract_point.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend_attract_point.recommend_record_id
     *
     * @mbg.generated
     */
    private Integer recommendRecordId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend_attract_point.attract_point_id
     *
     * @mbg.generated
     */
    private Integer attractPointId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend_attract_point.created_at
     *
     * @mbg.generated
     */
    private Date createdAt;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend_attract_point.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend_attract_point.id
     *
     * @return the value of recommend_attract_point.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend_attract_point.id
     *
     * @param id the value for recommend_attract_point.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend_attract_point.recommend_record_id
     *
     * @return the value of recommend_attract_point.recommend_record_id
     *
     * @mbg.generated
     */
    public Integer getRecommendRecordId() {
        return recommendRecordId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend_attract_point.recommend_record_id
     *
     * @param recommendRecordId the value for recommend_attract_point.recommend_record_id
     *
     * @mbg.generated
     */
    public void setRecommendRecordId(Integer recommendRecordId) {
        this.recommendRecordId = recommendRecordId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend_attract_point.attract_point_id
     *
     * @return the value of recommend_attract_point.attract_point_id
     *
     * @mbg.generated
     */
    public Integer getAttractPointId() {
        return attractPointId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend_attract_point.attract_point_id
     *
     * @param attractPointId the value for recommend_attract_point.attract_point_id
     *
     * @mbg.generated
     */
    public void setAttractPointId(Integer attractPointId) {
        this.attractPointId = attractPointId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend_attract_point.created_at
     *
     * @return the value of recommend_attract_point.created_at
     *
     * @mbg.generated
     */
    public Date getCreatedAt() {
        return createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend_attract_point.created_at
     *
     * @param createdAt the value for recommend_attract_point.created_at
     *
     * @mbg.generated
     */
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend_attract_point.name
     *
     * @return the value of recommend_attract_point.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend_attract_point.name
     *
     * @param name the value for recommend_attract_point.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name;
    }
}