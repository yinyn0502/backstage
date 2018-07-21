package com.ueater.backstage.common.model;

import java.util.ArrayList;
import java.util.List;

public class SysConfigExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SysConfigExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andSmtpIsNull() {
            addCriterion("smtp is null");
            return (Criteria) this;
        }

        public Criteria andSmtpIsNotNull() {
            addCriterion("smtp is not null");
            return (Criteria) this;
        }

        public Criteria andSmtpEqualTo(String value) {
            addCriterion("smtp =", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpNotEqualTo(String value) {
            addCriterion("smtp <>", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpGreaterThan(String value) {
            addCriterion("smtp >", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpGreaterThanOrEqualTo(String value) {
            addCriterion("smtp >=", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpLessThan(String value) {
            addCriterion("smtp <", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpLessThanOrEqualTo(String value) {
            addCriterion("smtp <=", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpLike(String value) {
            addCriterion("smtp like", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpNotLike(String value) {
            addCriterion("smtp not like", value, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpIn(List<String> values) {
            addCriterion("smtp in", values, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpNotIn(List<String> values) {
            addCriterion("smtp not in", values, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpBetween(String value1, String value2) {
            addCriterion("smtp between", value1, value2, "smtp");
            return (Criteria) this;
        }

        public Criteria andSmtpNotBetween(String value1, String value2) {
            addCriterion("smtp not between", value1, value2, "smtp");
            return (Criteria) this;
        }

        public Criteria andPortIsNull() {
            addCriterion("port is null");
            return (Criteria) this;
        }

        public Criteria andPortIsNotNull() {
            addCriterion("port is not null");
            return (Criteria) this;
        }

        public Criteria andPortEqualTo(String value) {
            addCriterion("port =", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotEqualTo(String value) {
            addCriterion("port <>", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortGreaterThan(String value) {
            addCriterion("port >", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortGreaterThanOrEqualTo(String value) {
            addCriterion("port >=", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortLessThan(String value) {
            addCriterion("port <", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortLessThanOrEqualTo(String value) {
            addCriterion("port <=", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortLike(String value) {
            addCriterion("port like", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotLike(String value) {
            addCriterion("port not like", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortIn(List<String> values) {
            addCriterion("port in", values, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotIn(List<String> values) {
            addCriterion("port not in", values, "port");
            return (Criteria) this;
        }

        public Criteria andPortBetween(String value1, String value2) {
            addCriterion("port between", value1, value2, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotBetween(String value1, String value2) {
            addCriterion("port not between", value1, value2, "port");
            return (Criteria) this;
        }

        public Criteria andMailnameIsNull() {
            addCriterion("mailname is null");
            return (Criteria) this;
        }

        public Criteria andMailnameIsNotNull() {
            addCriterion("mailname is not null");
            return (Criteria) this;
        }

        public Criteria andMailnameEqualTo(String value) {
            addCriterion("mailname =", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameNotEqualTo(String value) {
            addCriterion("mailname <>", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameGreaterThan(String value) {
            addCriterion("mailname >", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameGreaterThanOrEqualTo(String value) {
            addCriterion("mailname >=", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameLessThan(String value) {
            addCriterion("mailname <", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameLessThanOrEqualTo(String value) {
            addCriterion("mailname <=", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameLike(String value) {
            addCriterion("mailname like", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameNotLike(String value) {
            addCriterion("mailname not like", value, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameIn(List<String> values) {
            addCriterion("mailname in", values, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameNotIn(List<String> values) {
            addCriterion("mailname not in", values, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameBetween(String value1, String value2) {
            addCriterion("mailname between", value1, value2, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailnameNotBetween(String value1, String value2) {
            addCriterion("mailname not between", value1, value2, "mailname");
            return (Criteria) this;
        }

        public Criteria andMailpasswordIsNull() {
            addCriterion("mailpassword is null");
            return (Criteria) this;
        }

        public Criteria andMailpasswordIsNotNull() {
            addCriterion("mailpassword is not null");
            return (Criteria) this;
        }

        public Criteria andMailpasswordEqualTo(String value) {
            addCriterion("mailpassword =", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordNotEqualTo(String value) {
            addCriterion("mailpassword <>", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordGreaterThan(String value) {
            addCriterion("mailpassword >", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordGreaterThanOrEqualTo(String value) {
            addCriterion("mailpassword >=", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordLessThan(String value) {
            addCriterion("mailpassword <", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordLessThanOrEqualTo(String value) {
            addCriterion("mailpassword <=", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordLike(String value) {
            addCriterion("mailpassword like", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordNotLike(String value) {
            addCriterion("mailpassword not like", value, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordIn(List<String> values) {
            addCriterion("mailpassword in", values, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordNotIn(List<String> values) {
            addCriterion("mailpassword not in", values, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordBetween(String value1, String value2) {
            addCriterion("mailpassword between", value1, value2, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andMailpasswordNotBetween(String value1, String value2) {
            addCriterion("mailpassword not between", value1, value2, "mailpassword");
            return (Criteria) this;
        }

        public Criteria andSmsnameIsNull() {
            addCriterion("smsname is null");
            return (Criteria) this;
        }

        public Criteria andSmsnameIsNotNull() {
            addCriterion("smsname is not null");
            return (Criteria) this;
        }

        public Criteria andSmsnameEqualTo(String value) {
            addCriterion("smsname =", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameNotEqualTo(String value) {
            addCriterion("smsname <>", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameGreaterThan(String value) {
            addCriterion("smsname >", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameGreaterThanOrEqualTo(String value) {
            addCriterion("smsname >=", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameLessThan(String value) {
            addCriterion("smsname <", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameLessThanOrEqualTo(String value) {
            addCriterion("smsname <=", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameLike(String value) {
            addCriterion("smsname like", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameNotLike(String value) {
            addCriterion("smsname not like", value, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameIn(List<String> values) {
            addCriterion("smsname in", values, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameNotIn(List<String> values) {
            addCriterion("smsname not in", values, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameBetween(String value1, String value2) {
            addCriterion("smsname between", value1, value2, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmsnameNotBetween(String value1, String value2) {
            addCriterion("smsname not between", value1, value2, "smsname");
            return (Criteria) this;
        }

        public Criteria andSmspasswordIsNull() {
            addCriterion("smspassword is null");
            return (Criteria) this;
        }

        public Criteria andSmspasswordIsNotNull() {
            addCriterion("smspassword is not null");
            return (Criteria) this;
        }

        public Criteria andSmspasswordEqualTo(String value) {
            addCriterion("smspassword =", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordNotEqualTo(String value) {
            addCriterion("smspassword <>", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordGreaterThan(String value) {
            addCriterion("smspassword >", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordGreaterThanOrEqualTo(String value) {
            addCriterion("smspassword >=", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordLessThan(String value) {
            addCriterion("smspassword <", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordLessThanOrEqualTo(String value) {
            addCriterion("smspassword <=", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordLike(String value) {
            addCriterion("smspassword like", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordNotLike(String value) {
            addCriterion("smspassword not like", value, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordIn(List<String> values) {
            addCriterion("smspassword in", values, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordNotIn(List<String> values) {
            addCriterion("smspassword not in", values, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordBetween(String value1, String value2) {
            addCriterion("smspassword between", value1, value2, "smspassword");
            return (Criteria) this;
        }

        public Criteria andSmspasswordNotBetween(String value1, String value2) {
            addCriterion("smspassword not between", value1, value2, "smspassword");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}