GO
CREATE TABLE BLC_ADDRESS (
  ADDRESS_ID         numeric(19) NOT NULL, 
  ADDRESS_LINE1      varchar(255) NOT NULL, 
  ADDRESS_LINE2      varchar(255) NULL, 
  CITY               varchar(255) NOT NULL, 
  COMPANY_NAME       varchar(255) NULL, 
  COUNTY             varchar(255) NULL, 
  FIRST_NAME         varchar(255) NULL, 
  IS_ACTIVE          bit NULL, 
  IS_BUSINESS        bit NULL, 
  IS_DEFAULT         bit NULL, 
  LAST_NAME          varchar(255) NULL, 
  POSTAL_CODE        varchar(255) NOT NULL, 
  PRIMARY_PHONE      varchar(255) NULL, 
  SECONDARY_PHONE    varchar(255) NULL, 
  STANDARDIZED       bit NULL, 
  TOKENIZED_ADDRESS  varchar(255) NULL, 
  VERIFICATION_LEVEL varchar(255) NULL, 
  ZIP_FOUR           varchar(255) NULL, 
  COUNTRY            varchar(255) NOT NULL, 
  STATE_PROV_REGION  varchar(255) NOT NULL, 
  PRIMARY KEY (ADDRESS_ID));
GO
CREATE TABLE BLC_BANK_ACCOUNT_PAYMENT (
  PAYMENT_ID       numeric(19) NOT NULL, 
  ACCOUNT_NUMBER   varchar(255) NOT NULL, 
  REFERENCE_NUMBER varchar(255) NOT NULL, 
  ROUTING_NUMBER   varchar(255) NOT NULL, 
  PRIMARY KEY (PAYMENT_ID));
GO
CREATE TABLE BLC_BASE_PRICE (
  BASE_PRICE_ID numeric(19) NOT NULL, 
  AMOUNT        decimal(19, 2) NOT NULL, 
  CREATED_BY    numeric(19) NULL, 
  DATE_CREATED  datetime NULL, 
  DATE_UPDATED  datetime NULL, 
  UPDATED_BY    numeric(19) NULL, 
  END_DATE      datetime NULL, 
  START_DATE    datetime NULL, 
  SKU_ID        numeric(19) NOT NULL, 
  PRIMARY KEY (BASE_PRICE_ID));
GO
CREATE TABLE BLC_BUNDLE_ORDER_ITEM (
  NAME          varchar(255) NULL, 
  ORDER_ITEM_ID numeric(19) NOT NULL, 
  PRIMARY KEY (ORDER_ITEM_ID));
GO
CREATE TABLE BLC_CANDIDATE_FG_OFFER (
  CANDIDATE_FG_OFFER_ID numeric(19) NOT NULL, 
  DISCOUNTED_PRICE      decimal(19, 2) NULL, 
  FULFILLMENT_GROUP_ID  numeric(19) NOT NULL, 
  OFFER_ID              numeric(19) NOT NULL, 
  PRIMARY KEY (CANDIDATE_FG_OFFER_ID));
GO
CREATE TABLE BLC_CANDIDATE_ITEM_OFFER (
  CANDIDATE_ITEM_OFFER_ID numeric(19) NOT NULL, 
  DISCOUNTED_PRICE        decimal(19, 2) NULL, 
  OFFER_ID                numeric(19) NOT NULL, 
  ORDER_ITEM_ID           numeric(19) NOT NULL, 
  PRIMARY KEY (CANDIDATE_ITEM_OFFER_ID));
GO
CREATE TABLE BLC_CANDIDATE_ORDER_OFFER (
  CANDIDATE_ORDER_OFFER_ID numeric(19) NOT NULL, 
  DISCOUNTED_PRICE         decimal(19, 2) NULL, 
  OFFER_ID                 numeric(19) NOT NULL, 
  ORDER_ID                 numeric(19) NOT NULL, 
  PRIMARY KEY (CANDIDATE_ORDER_OFFER_ID));
GO
CREATE TABLE BLC_CATEGORY (
  CATEGORY_ID                numeric(19) NOT NULL, 
  ACTIVE_END_DATE            datetime NULL, 
  ACTIVE_START_DATE          datetime NULL, 
  DESCRIPTION                varchar(255) NULL, 
  DISPLAY_TEMPLATE           varchar(255) NULL, 
  LONG_DESCRIPTION           varchar(255) NULL, 
  NAME                       varchar(255) NOT NULL, 
  URL                        varchar(255) NULL, 
  URL_KEY                    varchar(255) NULL, 
  DEFAULT_PARENT_CATEGORY_ID numeric(19) NULL, 
  PRIMARY KEY (CATEGORY_ID));
GO
CREATE TABLE BLC_CATEGORY_IMAGE (
  CATEGORY_ID numeric(19) NOT NULL, 
  URL         varchar(255) NULL, 
  NAME        varchar(5) NOT NULL, 
  PRIMARY KEY (CATEGORY_ID, 
  NAME));
GO
CREATE TABLE BLC_CATEGORY_PRODUCT_XREF (
  ID            numeric(19) NOT NULL, 
  DISPLAY_ORDER int NULL, 
  CATEGORY_ID   numeric(19) NOT NULL, 
  PRODUCT_ID    numeric(19) NOT NULL, 
  PRIMARY KEY (ID));
GO
CREATE TABLE BLC_CATEGORY_XREF (
  CATEGORY_ID     numeric(19) NOT NULL, 
  DISPLAY_ORDER   int NULL, 
  SUB_CATEGORY_ID numeric(19) NOT NULL, 
  PRIMARY KEY (CATEGORY_ID, 
  SUB_CATEGORY_ID));
GO
CREATE TABLE BLC_CHALLENGE_QUESTION (
  QUESTION_ID numeric(19) NOT NULL, 
  QUESTION    varchar(255) NOT NULL, 
  PRIMARY KEY (QUESTION_ID));
GO
CREATE TABLE BLC_COUNTRY (
  ABBREVIATION varchar(255) NOT NULL, 
  NAME         varchar(255) NOT NULL, 
  PRIMARY KEY (ABBREVIATION));
GO
CREATE TABLE BLC_CREDIT_CARD_PAYMENT (
  PAYMENT_ID       numeric(19) NOT NULL, 
  EXPIRATION_MONTH int NOT NULL, 
  EXPIRATION_YEAR  int NOT NULL, 
  PAN              varchar(255) NOT NULL, 
  REFERENCE_NUMBER varchar(255) NOT NULL, 
  PRIMARY KEY (PAYMENT_ID));
GO
CREATE TABLE BLC_CUSTOMER (
  CUSTOMER_ID              numeric(19) NOT NULL, 
  CREATED_BY               numeric(19) NULL, 
  DATE_CREATED             datetime NULL, 
  DATE_UPDATED             datetime NULL, 
  UPDATED_BY               numeric(19) NULL, 
  CHALLENGE_QUESTION_ID    numeric(19) NULL, 
  CHALLENGE_ANSWER         varchar(255) NULL, 
  EMAIL_ADDRESS            varchar(255) NULL, 
  FIRST_NAME               varchar(255) NULL, 
  LAST_NAME                varchar(255) NULL, 
  PASSWORD                 varchar(255) NULL, 
  PASSWORD_CHANGE_REQUIRED bit NULL, 
  RECEIVE_EMAIL            bit NULL, 
  IS_REGISTERED            bit NULL, 
  USER_NAME                varchar(255) NULL UNIQUE, 
  PRIMARY KEY (CUSTOMER_ID));
GO
CREATE TABLE BLC_CUSTOMER_ADDRESS (
  CUSTOMER_ADDRESS_ID numeric(19) NOT NULL, 
  ADDRESS_NAME        varchar(255) NULL, 
  ADDRESS_ID          numeric(19) NOT NULL, 
  CUSTOMER_ID         numeric(19) NOT NULL, 
  PRIMARY KEY (CUSTOMER_ADDRESS_ID));
GO
CREATE TABLE BLC_CUSTOMER_OFFER_XREF (
  CUSTOMER_OFFER_ID numeric(19) NOT NULL, 
  CUSTOMER_ID       numeric(19) NOT NULL, 
  OFFER_ID          numeric(19) NOT NULL, 
  PRIMARY KEY (CUSTOMER_OFFER_ID));
GO
CREATE TABLE BLC_CUSTOMER_PHONE (
  CUSTOMER_PHONE_ID numeric(19) NOT NULL, 
  PHONE_NAME        varchar(255) NULL, 
  CUSTOMER_ID       numeric(19) NOT NULL, 
  PHONE_ID          numeric(19) NOT NULL, 
  PRIMARY KEY (CUSTOMER_PHONE_ID));
GO
CREATE TABLE BLC_CUSTOMER_ROLE (
  CUSTOMER_ROLE_ID numeric(19) NOT NULL, 
  CUSTOMER_ID      numeric(19) NOT NULL, 
  ROLE_ID          numeric(19) NOT NULL UNIQUE, 
  PRIMARY KEY (CUSTOMER_ROLE_ID));
GO
CREATE TABLE BLC_DISCRETE_ORDER_ITEM (
  ORDER_ITEM_ID        numeric(19) NOT NULL, 
  BUNDLE_ORDER_ITEM_ID numeric(19) NULL, 
  PRODUCT_ID           numeric(19) NULL, 
  SKU_ID               numeric(19) NOT NULL, 
  PRIMARY KEY (ORDER_ITEM_ID));
GO
CREATE TABLE BLC_EMAIL_TRACKING (
  EMAIL_TRACKING_ID numeric(19) NOT NULL, 
  DATE_SENT         datetime NULL, 
  EMAIL_ADDRESS     varchar(255) NULL, 
  TYPE              varchar(255) NULL, 
  PRIMARY KEY (EMAIL_TRACKING_ID));
GO
CREATE TABLE BLC_EMAIL_TRACKING_CLICKS (
  CLICK_ID          numeric(19) NOT NULL, 
  DATE_CLICKED      datetime NOT NULL, 
  DESTINATION_URI   varchar(255) NULL, 
  QUERY_STRING      varchar(255) NULL, 
  CUSTOMER_ID       numeric(19) NOT NULL, 
  EMAIL_TRACKING_ID numeric(19) NOT NULL, 
  PRIMARY KEY (CLICK_ID));
GO
CREATE TABLE BLC_EMAIL_TRACKING_OPENS (
  OPEN_ID           numeric(19) NOT NULL, 
  DATE_OPENED       datetime NULL, 
  USER_AGENT        varchar(255) NULL, 
  EMAIL_TRACKING_ID numeric(19) NULL, 
  PRIMARY KEY (OPEN_ID));
GO
CREATE TABLE BLC_FG_ADJUSTMENT (
  FG_ADJUSTMENT_ID     numeric(19) NOT NULL, 
  ADJUSTMENT_REASON    varchar(255) NOT NULL, 
  ADJUSTMENT_VALUE     decimal(19, 2) NOT NULL, 
  FULFILLMENT_GROUP_ID numeric(19) NOT NULL, 
  OFFER_ID             numeric(19) NOT NULL, 
  PRIMARY KEY (FG_ADJUSTMENT_ID));
GO
CREATE TABLE BLC_FULFILLMENT_GROUP (
  FULFILLMENT_GROUP_ID numeric(19) NOT NULL, 
  CITY_TAX             decimal(19, 2) NULL, 
  COUNTRY_TAX          decimal(19, 2) NULL, 
  COUNTY_TAX           decimal(19, 2) NULL, 
  DELIVERY_INSTRUCTION varchar(255) NULL, 
  MERCHANDISE_TOTAL    decimal(19, 2) NULL, 
  METHOD               varchar(255) NULL, 
  IS_PRIMARY           bit NULL, 
  REFERENCE_NUMBER     varchar(255) NULL, 
  RETAIL_PRICE         decimal(19, 2) NULL, 
  SALE_PRICE           decimal(19, 2) NULL, 
  PRICE                decimal(19, 2) NULL, 
  STATE_TAX            decimal(19, 2) NULL, 
  STATUS               varchar(255) NULL, 
  TOTAL                decimal(19, 2) NULL, 
  TOTAL_TAX            decimal(19, 2) NULL, 
  TYPE                 varchar(255) NULL, 
  ADDRESS_ID           numeric(19) NULL, 
  PERSONAL_MESSAGE_ID  numeric(19) NULL, 
  PHONE_ID             numeric(19) NULL, 
  PRIMARY KEY (FULFILLMENT_GROUP_ID));
GO
CREATE TABLE BLC_FULFILLMENT_GROUP_ITEM (
  FULFILLMENT_GROUP_ITEM_ID numeric(19) NOT NULL, 
  PRICE                     decimal(19, 2) NULL, 
  QUANTITY                  int NOT NULL, 
  RETAIL_PRICE              decimal(19, 2) NULL, 
  SALE_PRICE                decimal(19, 2) NULL, 
  STATUS                    varchar(255) NULL, 
  FULFILLMENT_GROUP_ID      numeric(19) NOT NULL, 
  ORDER_ITEM_ID             numeric(19) NOT NULL UNIQUE, 
  PRIMARY KEY (FULFILLMENT_GROUP_ITEM_ID));
GO
CREATE TABLE BLC_GIFTWRAP_ORDER_ITEM (
  ORDER_ITEM_ID numeric(19) NOT NULL, 
  PRIMARY KEY (ORDER_ITEM_ID));
GO
CREATE TABLE BLC_GIFT_CARD_PAYMENT (
  PAYMENT_ID       numeric(19) NOT NULL, 
  PAN              varchar(255) NOT NULL, 
  PIN              varchar(255) NULL, 
  REFERENCE_NUMBER varchar(255) NOT NULL, 
  PRIMARY KEY (PAYMENT_ID));
GO
CREATE TABLE BLC_ID_GENERATION (
  ID_TYPE     varchar(255) NOT NULL, 
  BATCH_SIZE  numeric(19) NOT NULL, 
  BATCH_START numeric(19) NOT NULL, 
  version     int NULL, 
  PRIMARY KEY (ID_TYPE));
GO
CREATE TABLE BLC_OFFER (
  OFFER_ID                     numeric(19) NOT NULL, 
  APPLIES_WHEN_RULES           varchar(255) NULL, 
  APPLIES_TO_RULES             varchar(255) NULL, 
  APPLY_OFFER_TO_MARKED_ITEMS  bit NULL, 
  APPLY_TO_SALE_PRICE          bit NULL, 
  COMBINABLE_WITH_OTHER_OFFERS bit NULL, 
  OFFER_DELIVERY_TYPE          varchar(255) NOT NULL, 
  OFFER_DESCRIPTION            varchar(255) NULL, 
  OFFER_DISCOUNT_TYPE          varchar(255) NULL, 
  END_DATE                     datetime NULL, 
  MAX_USES                     int NULL, 
  OFFER_NAME                   varchar(255) NOT NULL, 
  OFFER_PRIORITY               int NULL, 
  STACKABLE                    bit NULL, 
  START_DATE                   datetime NULL, 
  TARGET_SYSTEM                varchar(255) NULL, 
  OFFER_TYPE                   varchar(255) NOT NULL, 
  USES                         int NULL, 
  OFFER_VALUE                  decimal(19, 2) NOT NULL, 
  PRIMARY KEY (OFFER_ID));
GO
CREATE TABLE BLC_OFFER_CODE (
  OFFER_CODE_ID numeric(19) NOT NULL, 
  END_DATE      datetime NULL, 
  MAX_USES      int NULL, 
  OFFER_CODE    varchar(255) NOT NULL, 
  START_DATE    datetime NULL, 
  USES          int NULL, 
  OFFER_ID      numeric(19) NOT NULL, 
  PRIMARY KEY (OFFER_CODE_ID));
GO
CREATE TABLE BLC_ORDER (
  ORDER_ID       numeric(19) NOT NULL, 
  CREATED_BY     numeric(19) NULL, 
  DATE_CREATED   datetime NULL, 
  DATE_UPDATED   datetime NULL, 
  UPDATED_BY     numeric(19) NULL, 
  CITY_TAX       decimal(19, 2) NULL, 
  COUNTRY_TAX    decimal(19, 2) NULL, 
  COUNTY_TAX     decimal(19, 2) NULL, 
  EMAIL_ADDRESS  varchar(255) NULL, 
  NAME           varchar(255) NULL, 
  ORDER_NUMBER   varchar(255) NULL, 
  STATE_TAX      decimal(19, 2) NULL, 
  ORDER_STATUS   varchar(255) NULL, 
  ORDER_SUBTOTAL decimal(19, 2) NULL, 
  SUBMIT_DATE    datetime NULL, 
  ORDER_TOTAL    decimal(19, 2) NULL, 
  TOTAL_SHIPPING decimal(19, 2) NULL, 
  TOTAL_TAX      decimal(19, 2) NULL, 
  CUSTOMER_ID    numeric(19) NOT NULL, 
  PRIMARY KEY (ORDER_ID));
GO
CREATE TABLE BLC_ORDER_ADJUSTMENT (
  ORDER_ADJUSTMENT_ID numeric(19) NOT NULL, 
  ADJUSTMENT_REASON   varchar(255) NOT NULL, 
  ADJUSTMENT_VALUE    decimal(19, 2) NOT NULL, 
  OFFER_ID            numeric(19) NOT NULL, 
  ORDER_ID            numeric(19) NOT NULL, 
  PRIMARY KEY (ORDER_ADJUSTMENT_ID));
GO
CREATE TABLE BLC_ORDER_ITEM (
  ORDER_ITEM_ID       numeric(19) NOT NULL, 
  ORDER_ITEM_TYPE     varchar(255) NULL, 
  PRICE               decimal(19, 2) NULL, 
  QUANTITY            int NOT NULL, 
  RETAIL_PRICE        decimal(19, 2) NULL, 
  SALE_PRICE          decimal(19, 2) NULL, 
  CATEGORY_ID         numeric(19) NULL, 
  GIFT_WRAP_ITEM_ID   numeric(19) NULL, 
  ORDER_ID            numeric(19) NULL, 
  PERSONAL_MESSAGE_ID numeric(19) NULL, 
  PRIMARY KEY (ORDER_ITEM_ID));
GO
CREATE TABLE BLC_ORDER_ITEM_ADJUSTMENT (
  ORDER_ITEM_ADJUSTMENT_ID numeric(19) NOT NULL, 
  ADJUSTMENT_REASON        varchar(255) NOT NULL, 
  ADJUSTMENT_VALUE         decimal(19, 2) NOT NULL, 
  OFFER_ID                 numeric(19) NOT NULL, 
  ORDER_ITEM_ID            numeric(19) NOT NULL, 
  PRIMARY KEY (ORDER_ITEM_ADJUSTMENT_ID));
GO
CREATE TABLE BLC_ORDER_OFFER_CODE_XREF (
  ORDER_ID      numeric(19) NOT NULL, 
  OFFER_CODE_ID numeric(19) NOT NULL);
GO
CREATE TABLE BLC_ORDER_PAYMENT (
  PAYMENT_ID       numeric(19) NOT NULL, 
  AMOUNT           decimal(19, 2) NULL, 
  REFERENCE_NUMBER varchar(255) NULL, 
  PAYMENT_TYPE     varchar(255) NOT NULL, 
  ADDRESS_ID       numeric(19) NULL, 
  ORDER_ID         numeric(19) NOT NULL, 
  PHONE_ID         numeric(19) NULL, 
  PRIMARY KEY (PAYMENT_ID));
GO
CREATE TABLE BLC_PAYMENT_ADDITIONAL_FIELDS (
  PAYMENT_RESPONSE_ITEM_ID numeric(19) NOT NULL, 
  FIELD_VALUE              varchar(255) NULL, 
  FIELD_NAME               varchar(150) NOT NULL, 
  PRIMARY KEY (PAYMENT_RESPONSE_ITEM_ID, 
  FIELD_NAME));
GO
CREATE TABLE BLC_PAYMENT_LOG (
  PAYMENT_LOG_ID                numeric(19) NOT NULL, 
  AMOUNT_PAID                   decimal(19, 2) NULL, 
  EXCEPTION_MESSAGE             varchar(255) NULL, 
  LOG_TYPE                      varchar(255) NOT NULL, 
  PAYMENT_INFO_REFERENCE_NUMBER varchar(255) NULL, 
  TRANSACTION_SUCCESS           bit NULL, 
  TRANSACTION_TIMESTAMP         datetime NOT NULL, 
  TRANSACTION_TYPE              varchar(255) NOT NULL, 
  USER_NAME                     varchar(255) NOT NULL, 
  CUSTOMER_ID                   numeric(19) NULL, 
  ORDER_PAYMENT_ID              numeric(19) NULL, 
  PRIMARY KEY (PAYMENT_LOG_ID));
GO
CREATE TABLE BLC_PAYMENT_RESPONSE_ITEM (
  PAYMENT_RESPONSE_ITEM_ID      numeric(19) NOT NULL, 
  AMOUNT_PAID                   decimal(19, 2) NULL, 
  AUTHORIZATION_CODE            varchar(255) NULL, 
  AVS_CODE                      varchar(255) NULL, 
  IMPLEMENTOR_RESPONSE_CODE     varchar(255) NULL, 
  IMPLEMENTOR_RESPONSE_TEXT     varchar(255) NULL, 
  MIDDLEWARE_RESPONSE_CODE      varchar(255) NULL, 
  MIDDLEWARE_RESPONSE_TEXT      varchar(255) NULL, 
  PAYMENT_INFO_REFERENCE_NUMBER varchar(255) NULL, 
  PROCESSOR_RESPONSE_CODE       varchar(255) NULL, 
  PROCESSOR_RESPONSE_TEXT       varchar(255) NULL, 
  REFERENCE_NUMBER              varchar(255) NULL, 
  REMAINING_BALANCE             decimal(19, 2) NULL, 
  TRANSACTION_ID                varchar(255) NULL, 
  TRANSACTION_SUCCESS           bit NULL, 
  TRANSACTION_TIMESTAMP         datetime NOT NULL, 
  TRANSACTION_TYPE              varchar(255) NOT NULL, 
  USER_NAME                     varchar(255) NOT NULL, 
  CUSTOMER_ID                   numeric(19) NOT NULL, 
  ORDER_PAYMENT_ID              numeric(19) NULL, 
  PRIMARY KEY (PAYMENT_RESPONSE_ITEM_ID));
GO
CREATE TABLE BLC_PERSONAL_MESSAGE (
  PERSONAL_MESSAGE_ID numeric(19) NOT NULL, 
  MESSAGE             varchar(255) NULL, 
  MESSAGE_FROM        varchar(255) NULL, 
  MESSAGE_TO          varchar(255) NULL, 
  OCCASION            varchar(255) NULL, 
  PRIMARY KEY (PERSONAL_MESSAGE_ID));
GO
CREATE TABLE BLC_PHONE (
  PHONE_ID     numeric(19) NOT NULL, 
  IS_ACTIVE    bit NULL, 
  IS_DEFAULT   bit NULL, 
  PHONE_NUMBER varchar(255) NOT NULL, 
  PRIMARY KEY (PHONE_ID));
GO
CREATE TABLE BLC_PRODUCT (
  PRODUCT_ID          numeric(19) NOT NULL, 
  ACTIVE_END_DATE     datetime NULL, 
  ACTIVE_START_DATE   datetime NULL, 
  DESCRIPTION         varchar(255) NULL, 
  LONG_DESCRIPTION    varchar(255) NULL, 
  MANUFACTURE         varchar(255) NULL, 
  MODEL               varchar(255) NULL, 
  NAME                varchar(255) NOT NULL, 
  WEIGHT              decimal(19, 2) NULL, 
  DEFAULT_CATEGORY_ID numeric(19) NULL, 
  IS_FEATURED_PRODUCT bit DEFAULT '0' NOT NULL, 
  PRIMARY KEY (PRODUCT_ID));
GO
CREATE TABLE BLC_PRODUCT_ATTRIBUTE (
  ID         numeric(19) NOT NULL, 
  NAME       varchar(255) NOT NULL, 
  SEARCHABLE bit NULL, 
  VALUE      varchar(255) NOT NULL, 
  PRODUCT_ID numeric(19) NOT NULL, 
  PRIMARY KEY (ID));
GO
CREATE TABLE BLC_PRODUCT_CROSS_SALE (
  CROSS_SALE_PRODUCT_ID numeric(19) NOT NULL, 
  PROMOTION_MESSAGE     varchar(255) NULL, 
  SEQUENCE              numeric(19) NULL, 
  PRODUCT_ID            numeric(19) NOT NULL, 
  PRIMARY KEY (CROSS_SALE_PRODUCT_ID));
GO
CREATE TABLE BLC_PRODUCT_FEATURED (
  FEATURED_PRODUCT_ID numeric(19) NOT NULL, 
  PROMOTION_MESSAGE   varchar(255) NULL, 
  SEQUENCE            numeric(19) NULL, 
  CATEGORY_ID         numeric(19) NULL, 
  PRODUCT_ID          numeric(19) NULL, 
  PRIMARY KEY (FEATURED_PRODUCT_ID));
GO
CREATE TABLE BLC_PRODUCT_IMAGE (
  PRODUCT_ID numeric(19) NOT NULL, 
  URL        varchar(255) NULL, 
  NAME       varchar(5) NOT NULL, 
  PRIMARY KEY (PRODUCT_ID, 
  NAME));
GO
CREATE TABLE BLC_PRODUCT_SKU_XREF (
  PRODUCT_ID numeric(19) NOT NULL, 
  SKU_ID     numeric(19) NOT NULL);
GO
CREATE TABLE BLC_ROLE (
  ROLE_ID   numeric(19) NOT NULL, 
  ROLE_NAME varchar(255) NOT NULL, 
  PRIMARY KEY (ROLE_ID));
GO
CREATE TABLE BLC_SHIPPING_RATE (
  ID              numeric(19) NOT NULL, 
  BAND_RESULT_PCT int NOT NULL, 
  BAND_RESULT_QTY decimal(19, 2) NOT NULL, 
  BAND_UNIT_QTY   decimal(19, 2) NOT NULL, 
  FEE_BAND        int NOT NULL, 
  FEE_SUB_TYPE    varchar(255) NULL, 
  FEE_TYPE        varchar(255) NOT NULL, 
  PRIMARY KEY (ID));
GO
CREATE TABLE BLC_SKU (
  SKU_ID            numeric(19) NOT NULL, 
  ACTIVE_END_DATE   datetime NULL, 
  ACTIVE_START_DATE datetime NULL, 
  AVAILABLE_FLAG    char(1) NULL, 
  DESCRIPTION       varchar(255) NULL, 
  DISCOUNTABLE_FLAG char(1) NULL, 
  LONG_DESCRIPTION  varchar(255) NULL, 
  NAME              varchar(255) NOT NULL, 
  RETAIL_PRICE      decimal(19, 2) NOT NULL, 
  SALE_PRICE        decimal(19, 2) NULL, 
  TAXABLE_FLAG      char(1) NULL, 
  PRIMARY KEY (SKU_ID));
GO
CREATE TABLE BLC_SKU_ATTRIBUTE (
  ID         numeric(19) NOT NULL, 
  NAME       varchar(255) NOT NULL, 
  SEARCHABLE bit NULL, 
  VALUE      varchar(255) NOT NULL, 
  SKU_ID     numeric(19) NOT NULL, 
  PRIMARY KEY (ID));
GO
CREATE TABLE BLC_SKU_AVAILABILITY (
  SKU_AVAILABILITY_ID numeric(19) NOT NULL, 
  AVAILABILITY_DATE   datetime NULL, 
  AVAILABILITY_STATUS varchar(255) NULL, 
  LOCATION_ID         numeric(19) NULL, 
  QTY_ON_HAND         int NULL, 
  RESERVE_QTY         int NULL, 
  SKU_ID              numeric(19) NULL, 
  PRIMARY KEY (SKU_AVAILABILITY_ID));
GO
CREATE TABLE BLC_SKU_IMAGE (
  SKU_ID numeric(19) NOT NULL, 
  URL    varchar(255) NULL, 
  NAME   varchar(5) NOT NULL, 
  PRIMARY KEY (SKU_ID, 
  NAME));
GO
CREATE TABLE BLC_STATE (
  ABBREVIATION varchar(255) NOT NULL, 
  NAME         varchar(255) NOT NULL, 
  PRIMARY KEY (ABBREVIATION));
GO
CREATE TABLE BLC_TARGET_CONTENT (
  TARGET_CONTENT_ID numeric(19) NOT NULL, 
  CONTENT           varchar(255) NULL, 
  CONTENT_NAME      varchar(255) NOT NULL, 
  CONTENT_TYPE      varchar(255) NOT NULL, 
  OFFLINE_DATE      datetime NULL, 
  ONLINE_DATE       datetime NULL, 
  PRIORITY          int NOT NULL, 
  URL               varchar(255) NULL, 
  PRIMARY KEY (TARGET_CONTENT_ID));
GO
CREATE TABLE BLC_USER (
  USER_ID                  numeric(19) NOT NULL, 
  CHALLENGE_ANSWER         varchar(255) NULL, 
  CHALLENGE_QUESTION       varchar(255) NULL, 
  EMAIL_ADDRESS            varchar(255) NULL, 
  FIRST_NAME               varchar(255) NULL, 
  LAST_NAME                varchar(255) NULL, 
  PASSWORD                 varchar(255) NOT NULL, 
  PASSWORD_CHANGE_REQUIRED bit NULL, 
  USER_NAME                varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (USER_ID));
GO
CREATE TABLE BLC_USER_ROLE (
  USER_ROLE_ID numeric(19) NOT NULL, 
  ROLE_ID      numeric(19) NOT NULL UNIQUE, 
  USER_ID      numeric(19) NOT NULL, 
  PRIMARY KEY (USER_ROLE_ID));
GO
CREATE TABLE OFFER_AUDIT (
  OFFER_AUDIT_ID       numeric(19) NOT NULL, 
  CUSTOMER_ID          numeric(19) NULL, 
  OFFER_CODE_ID        numeric(19) NULL, 
  OFFER_TYPE           varchar(255) NULL, 
  REDEEMED_DATE        datetime NULL, 
  RELATED_ID           numeric(19) NULL, 
  RELATED_PRICE        decimal(19, 2) NULL, 
  RELATED_RETAIL_PRICE decimal(19, 2) NULL, 
  RELATED_SALE_PRICE   decimal(19, 2) NULL, 
  OFFER_ID             numeric(19) NULL, 
  PRIMARY KEY (OFFER_AUDIT_ID));
GO
CREATE TABLE SEQUENCE_GENERATOR (
  ID_NAME varchar(255) NULL, 
  ID_VAL  int NULL);
GO
ALTER TABLE BLC_ADDRESS ADD CONSTRAINT FK_COUNTRY_ADDRESS FOREIGN KEY (COUNTRY) REFERENCES BLC_COUNTRY (ABBREVIATION);
GO
ALTER TABLE BLC_ADDRESS ADD CONSTRAINT FK_STATE_ADDRESS FOREIGN KEY (STATE_PROV_REGION) REFERENCES BLC_STATE (ABBREVIATION);
GO
ALTER TABLE BLC_BASE_PRICE ADD CONSTRAINT FK_SKU_BASE_PRICE FOREIGN KEY (SKU_ID) REFERENCES BLC_SKU (SKU_ID);
GO
ALTER TABLE BLC_BUNDLE_ORDER_ITEM ADD CONSTRAINT FK_ORDERITEM_BUNDLE FOREIGN KEY (ORDER_ITEM_ID) REFERENCES BLC_ORDER_ITEM (ORDER_ITEM_ID);
GO
ALTER TABLE BLC_CANDIDATE_FG_OFFER ADD CONSTRAINT FK_FG_CANDIDATEFGOFFER FOREIGN KEY (FULFILLMENT_GROUP_ID) REFERENCES BLC_FULFILLMENT_GROUP (FULFILLMENT_GROUP_ID);
GO
ALTER TABLE BLC_CANDIDATE_FG_OFFER ADD CONSTRAINT FK_OFFER_CANDIDATEFGOFFER FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_CANDIDATE_ITEM_OFFER ADD CONSTRAINT FK_OFFER_CANDIDATEITEMOFFER FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_CANDIDATE_ITEM_OFFER ADD CONSTRAINT FK_ITEM_CANDIDATEITEMOFFER FOREIGN KEY (ORDER_ITEM_ID) REFERENCES BLC_ORDER_ITEM (ORDER_ITEM_ID);
GO
ALTER TABLE BLC_CANDIDATE_ORDER_OFFER ADD CONSTRAINT FK_OFFER_CANDIDATEORDEROFFER FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_CANDIDATE_ORDER_OFFER ADD CONSTRAINT FK_ORDER_CANDIDATEORDEROFFER FOREIGN KEY (ORDER_ID) REFERENCES BLC_ORDER (ORDER_ID);
GO
ALTER TABLE BLC_CATEGORY ADD CONSTRAINT FK_CATEGORY_CATEGORY FOREIGN KEY (DEFAULT_PARENT_CATEGORY_ID) REFERENCES BLC_CATEGORY (CATEGORY_ID);
GO
ALTER TABLE BLC_CATEGORY_IMAGE ADD CONSTRAINT FK_CATEGORY_CATEGORYIMAGE FOREIGN KEY (CATEGORY_ID) REFERENCES BLC_CATEGORY (CATEGORY_ID);
GO
ALTER TABLE BLC_CATEGORY_PRODUCT_XREF ADD CONSTRAINT FK_CATEGORY_CATPRODXREF FOREIGN KEY (CATEGORY_ID) REFERENCES BLC_CATEGORY (CATEGORY_ID);
GO
ALTER TABLE BLC_CATEGORY_PRODUCT_XREF ADD CONSTRAINT FK_PRODUCT_CATPRODXREF FOREIGN KEY (PRODUCT_ID) REFERENCES BLC_PRODUCT (PRODUCT_ID);
GO
ALTER TABLE BLC_CATEGORY_XREF ADD CONSTRAINT FK_CATEGORY_CATXREF FOREIGN KEY (CATEGORY_ID) REFERENCES BLC_CATEGORY (CATEGORY_ID);
GO
ALTER TABLE BLC_CUSTOMER_ADDRESS ADD CONSTRAINT FK_ADDRESS_CUSTOMER_ADDRESS FOREIGN KEY (ADDRESS_ID) REFERENCES BLC_ADDRESS (ADDRESS_ID);
GO
ALTER TABLE BLC_CUSTOMER_ADDRESS ADD CONSTRAINT FK_CUSTOMER_CUSTOMERADDRESS FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID);
GO
ALTER TABLE BLC_CUSTOMER_OFFER_XREF ADD CONSTRAINT FK_CUSTOMER_CUSTOFFERXREF FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID);
GO
ALTER TABLE BLC_CUSTOMER_OFFER_XREF ADD CONSTRAINT FK_OFFER_CUSTOFFERXREF FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_CUSTOMER_PHONE ADD CONSTRAINT FK_CUSTOMER_CUSTOMERPHONE FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID);
GO
ALTER TABLE BLC_CUSTOMER_PHONE ADD CONSTRAINT FK_PHONE_CUSTOMERPHONE FOREIGN KEY (PHONE_ID) REFERENCES BLC_PHONE (PHONE_ID);
GO
ALTER TABLE BLC_CUSTOMER_ROLE ADD CONSTRAINT FK_CUSTOMER_CUSTOMERROLE FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID);
GO
ALTER TABLE BLC_CUSTOMER_ROLE ADD CONSTRAINT FK_ROLE_CUSTOMERROLE FOREIGN KEY (ROLE_ID) REFERENCES BLC_ROLE (ROLE_ID);
GO
ALTER TABLE BLC_DISCRETE_ORDER_ITEM ADD CONSTRAINT FK_BUNDLE_DISCRETE FOREIGN KEY (BUNDLE_ORDER_ITEM_ID) REFERENCES BLC_BUNDLE_ORDER_ITEM (ORDER_ITEM_ID);
GO
ALTER TABLE BLC_DISCRETE_ORDER_ITEM ADD CONSTRAINT FK_PRODUCT_DISCRETE FOREIGN KEY (PRODUCT_ID) REFERENCES BLC_PRODUCT (PRODUCT_ID);
GO
ALTER TABLE BLC_DISCRETE_ORDER_ITEM ADD CONSTRAINT FK_SKU_DISCRETE FOREIGN KEY (SKU_ID) REFERENCES BLC_SKU (SKU_ID);
GO
ALTER TABLE BLC_EMAIL_TRACKING_CLICKS ADD CONSTRAINT FK_CUSTOMER_EMAILTRACKCLICKS FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID) ON UPDATE No action ON DELETE No action;
GO
ALTER TABLE BLC_EMAIL_TRACKING_CLICKS ADD CONSTRAINT FK_EMAIL_TRACKINGCLICKS FOREIGN KEY (EMAIL_TRACKING_ID) REFERENCES BLC_EMAIL_TRACKING (EMAIL_TRACKING_ID);
GO
ALTER TABLE BLC_EMAIL_TRACKING_OPENS ADD CONSTRAINT FK_EMAIL_TRACKINGOPENS FOREIGN KEY (EMAIL_TRACKING_ID) REFERENCES BLC_EMAIL_TRACKING (EMAIL_TRACKING_ID);
GO
ALTER TABLE BLC_FG_ADJUSTMENT ADD CONSTRAINT FK_FG_FGADJUSTMENT FOREIGN KEY (FULFILLMENT_GROUP_ID) REFERENCES BLC_FULFILLMENT_GROUP (FULFILLMENT_GROUP_ID);
GO
ALTER TABLE BLC_FULFILLMENT_GROUP ADD CONSTRAINT FK_ADDRESS_FG FOREIGN KEY (ADDRESS_ID) REFERENCES BLC_ADDRESS (ADDRESS_ID);
GO
ALTER TABLE BLC_FULFILLMENT_GROUP ADD CONSTRAINT FK_MESSAGE_FG FOREIGN KEY (PERSONAL_MESSAGE_ID) REFERENCES BLC_PERSONAL_MESSAGE (PERSONAL_MESSAGE_ID);
GO
ALTER TABLE BLC_FULFILLMENT_GROUP ADD CONSTRAINT FK_PHONE_FG FOREIGN KEY (PHONE_ID) REFERENCES BLC_PHONE (PHONE_ID);
GO
ALTER TABLE BLC_FULFILLMENT_GROUP_ITEM ADD CONSTRAINT FK_FG_FGITEM FOREIGN KEY (FULFILLMENT_GROUP_ID) REFERENCES BLC_FULFILLMENT_GROUP (FULFILLMENT_GROUP_ID);
GO
ALTER TABLE BLC_FULFILLMENT_GROUP_ITEM ADD CONSTRAINT FK_ORDERITEM_FGITEM FOREIGN KEY (ORDER_ITEM_ID) REFERENCES BLC_ORDER_ITEM (ORDER_ITEM_ID);
GO
ALTER TABLE BLC_GIFTWRAP_ORDER_ITEM ADD CONSTRAINT FK_DISCRETE_GIFTWRAP FOREIGN KEY (ORDER_ITEM_ID) REFERENCES BLC_DISCRETE_ORDER_ITEM (ORDER_ITEM_ID);
GO
ALTER TABLE BLC_OFFER_CODE ADD CONSTRAINT FK_OFFER_OFFERCODE FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_ORDER ADD CONSTRAINT FK_CUSTOMER_ORDER FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID);
GO
ALTER TABLE BLC_ORDER_ADJUSTMENT ADD CONSTRAINT FK_OFFER_ORDERADJUSTMENT FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_ORDER_ADJUSTMENT ADD CONSTRAINT FK_ORDER_ORDERADJUSTMENT FOREIGN KEY (ORDER_ID) REFERENCES BLC_ORDER (ORDER_ID);
GO
ALTER TABLE BLC_ORDER_ITEM ADD CONSTRAINT FK_CATEGORY_ORDERITEM FOREIGN KEY (CATEGORY_ID) REFERENCES BLC_CATEGORY (CATEGORY_ID);
GO
ALTER TABLE BLC_ORDER_ITEM ADD CONSTRAINT FK_GIFTWRAP_ORDERITEM FOREIGN KEY (GIFT_WRAP_ITEM_ID) REFERENCES BLC_GIFTWRAP_ORDER_ITEM (ORDER_ITEM_ID);
GO
ALTER TABLE BLC_ORDER_ITEM ADD CONSTRAINT FK_ORDER_ORDERITEM FOREIGN KEY (ORDER_ID) REFERENCES BLC_ORDER (ORDER_ID);
GO
ALTER TABLE BLC_ORDER_ITEM ADD CONSTRAINT FK_PERSONALMESSAGE_ITEM FOREIGN KEY (PERSONAL_MESSAGE_ID) REFERENCES BLC_PERSONAL_MESSAGE (PERSONAL_MESSAGE_ID);
GO
ALTER TABLE BLC_ORDER_ITEM_ADJUSTMENT ADD CONSTRAINT FK_OFFER_ITEMADJUSTMENT FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_ORDER_ITEM_ADJUSTMENT ADD CONSTRAINT FK_ITEM_ITEMADJUSTMENT FOREIGN KEY (ORDER_ITEM_ID) REFERENCES BLC_ORDER_ITEM (ORDER_ITEM_ID);
GO
ALTER TABLE BLC_ORDER_OFFER_CODE_XREF ADD CONSTRAINT FK_ORDER_ORDEROFFERXREF FOREIGN KEY (ORDER_ID) REFERENCES BLC_ORDER (ORDER_ID);
GO
ALTER TABLE BLC_ORDER_OFFER_CODE_XREF ADD CONSTRAINT FK_OFFERCODE_ORDERXREF FOREIGN KEY (OFFER_CODE_ID) REFERENCES BLC_OFFER_CODE (OFFER_CODE_ID);
GO
ALTER TABLE BLC_ORDER_PAYMENT ADD CONSTRAINT FK_ADDRESS_PAYMENT FOREIGN KEY (ADDRESS_ID) REFERENCES BLC_ADDRESS (ADDRESS_ID);
GO
ALTER TABLE BLC_ORDER_PAYMENT ADD CONSTRAINT FK_ORDER_PAYMENT FOREIGN KEY (ORDER_ID) REFERENCES BLC_ORDER (ORDER_ID);
GO
ALTER TABLE BLC_ORDER_PAYMENT ADD CONSTRAINT FK_PHONE_PAYMENT FOREIGN KEY (PHONE_ID) REFERENCES BLC_PHONE (PHONE_ID);
GO
ALTER TABLE BLC_PAYMENT_ADDITIONAL_FIELDS ADD CONSTRAINT FK_PAYMENTRESPONSE_ADDITIONAL FOREIGN KEY (PAYMENT_RESPONSE_ITEM_ID) REFERENCES BLC_PAYMENT_RESPONSE_ITEM (PAYMENT_RESPONSE_ITEM_ID);
GO
ALTER TABLE BLC_PAYMENT_LOG ADD CONSTRAINT FK_CUSTOMER_PAYMENTLOG FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID);
GO
ALTER TABLE BLC_PAYMENT_LOG ADD CONSTRAINT FK_PAYMENT_LOG FOREIGN KEY (ORDER_PAYMENT_ID) REFERENCES BLC_ORDER_PAYMENT (PAYMENT_ID);
GO
ALTER TABLE BLC_PAYMENT_RESPONSE_ITEM ADD CONSTRAINT FK_CUSTOMER_PAYMENTRESPONSE FOREIGN KEY (CUSTOMER_ID) REFERENCES BLC_CUSTOMER (CUSTOMER_ID);
GO
ALTER TABLE BLC_PAYMENT_RESPONSE_ITEM ADD CONSTRAINT FK_PAYMENT_PAYMENTRESPONSE FOREIGN KEY (ORDER_PAYMENT_ID) REFERENCES BLC_ORDER_PAYMENT (PAYMENT_ID);
GO
ALTER TABLE BLC_PRODUCT ADD CONSTRAINT FK_CATEGORY_PRODUCT FOREIGN KEY (DEFAULT_CATEGORY_ID) REFERENCES BLC_CATEGORY (CATEGORY_ID);
GO
ALTER TABLE BLC_PRODUCT_ATTRIBUTE ADD CONSTRAINT FK_PRODUCT_ATTRIBUTE FOREIGN KEY (PRODUCT_ID) REFERENCES BLC_PRODUCT (PRODUCT_ID);
GO
ALTER TABLE BLC_PRODUCT_CROSS_SALE ADD CONSTRAINT FK_PRODUCT_CROSSSALE FOREIGN KEY (PRODUCT_ID) REFERENCES BLC_PRODUCT (PRODUCT_ID);
GO
ALTER TABLE BLC_PRODUCT_FEATURED ADD CONSTRAINT FK_CATEGORY_PRODFEATURED FOREIGN KEY (CATEGORY_ID) REFERENCES BLC_CATEGORY (CATEGORY_ID);
GO
ALTER TABLE BLC_PRODUCT_FEATURED ADD CONSTRAINT FK_PRODUCT_FEATURED FOREIGN KEY (PRODUCT_ID) REFERENCES BLC_PRODUCT (PRODUCT_ID);
GO
ALTER TABLE BLC_PRODUCT_IMAGE ADD CONSTRAINT FK_PRODUCT_IMAGE FOREIGN KEY (PRODUCT_ID) REFERENCES BLC_PRODUCT (PRODUCT_ID);
GO
ALTER TABLE BLC_PRODUCT_SKU_XREF ADD CONSTRAINT FK_PRODUCT_SKUXREF FOREIGN KEY (PRODUCT_ID) REFERENCES BLC_PRODUCT (PRODUCT_ID);
GO
ALTER TABLE BLC_PRODUCT_SKU_XREF ADD CONSTRAINT FK_SKU_SKUXREF FOREIGN KEY (SKU_ID) REFERENCES BLC_SKU (SKU_ID);
GO
ALTER TABLE BLC_SKU_ATTRIBUTE ADD CONSTRAINT FK_SKU_ATTRIBUTE FOREIGN KEY (SKU_ID) REFERENCES BLC_SKU (SKU_ID);
GO
ALTER TABLE BLC_SKU_IMAGE ADD CONSTRAINT FK_SKU_IMAGE FOREIGN KEY (SKU_ID) REFERENCES BLC_SKU (SKU_ID);
GO
ALTER TABLE BLC_USER_ROLE ADD CONSTRAINT FK_ROLE_USERROLE FOREIGN KEY (ROLE_ID) REFERENCES BLC_ROLE (ROLE_ID);
GO
ALTER TABLE BLC_USER_ROLE ADD CONSTRAINT FK_USER_USERROLE FOREIGN KEY (USER_ID) REFERENCES BLC_USER (USER_ID);
GO
ALTER TABLE OFFER_AUDIT ADD CONSTRAINT FK_OFFER_AUDIT FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
ALTER TABLE BLC_CUSTOMER ADD CONSTRAINT FK_CHALLENGEQUESTION_CUSTOMER FOREIGN KEY (CHALLENGE_QUESTION_ID) REFERENCES BLC_CHALLENGE_QUESTION (QUESTION_ID);
GO
ALTER TABLE BLC_FG_ADJUSTMENT ADD CONSTRAINT FK_OFFER_FGADJUSTMENT FOREIGN KEY (OFFER_ID) REFERENCES BLC_OFFER (OFFER_ID);
GO
CREATE INDEX ADDRESS_COUNTRY_INDEX 
  ON BLC_ADDRESS (COUNTRY);
GO
CREATE INDEX ADDRESS_STATE_INDEX 
  ON BLC_ADDRESS (STATE_PROV_REGION);
GO
CREATE INDEX BANKACCOUNT_INDEX 
  ON BLC_BANK_ACCOUNT_PAYMENT (REFERENCE_NUMBER);
GO
CREATE INDEX BASE_PRICE_INDEX 
  ON BLC_BASE_PRICE (SKU_ID);
GO
CREATE INDEX CANDIDATE_FG_INDEX 
  ON BLC_CANDIDATE_FG_OFFER (FULFILLMENT_GROUP_ID);
GO
CREATE INDEX CANDIDATE_FGOFFER_INDEX 
  ON BLC_CANDIDATE_FG_OFFER (OFFER_ID);
GO
CREATE INDEX CANDIDATE_ITEM_INDEX 
  ON BLC_CANDIDATE_ITEM_OFFER (ORDER_ITEM_ID);
GO
CREATE INDEX CANDIDATE_ITEMOFFER_INDEX 
  ON BLC_CANDIDATE_ITEM_OFFER (OFFER_ID);
GO
CREATE INDEX CANDIDATE_ORDEROFFER_INDEX 
  ON BLC_CANDIDATE_ORDER_OFFER (OFFER_ID);
GO
CREATE INDEX CANDIDATE_ORDER_INDEX 
  ON BLC_CANDIDATE_ORDER_OFFER (ORDER_ID);
GO
CREATE INDEX CATEGORY_NAME_INDEX 
  ON BLC_CATEGORY (NAME);
GO
CREATE INDEX CATEGORY_PARENT_INDEX 
  ON BLC_CATEGORY (DEFAULT_PARENT_CATEGORY_ID);
GO
CREATE INDEX CATEGORY_URLKEY_INDEX 
  ON BLC_CATEGORY (URL_KEY);
GO
CREATE INDEX CATEGORYIMAGE_CATEGORY_INDEX 
  ON BLC_CATEGORY_IMAGE (CATEGORY_ID);
GO
CREATE INDEX CATEGORY_CATEGORY_INDEX 
  ON BLC_CATEGORY_PRODUCT_XREF (CATEGORY_ID);
GO
CREATE INDEX CATEGORY_PRODUCT_INDEX 
  ON BLC_CATEGORY_PRODUCT_XREF (PRODUCT_ID);
GO
CREATE INDEX CATEGORYXREF_CATEGORY_INDEX 
  ON BLC_CATEGORY_XREF (CATEGORY_ID);
GO
CREATE INDEX CATEGORYXREF_SUB_INDEX 
  ON BLC_CATEGORY_XREF (SUB_CATEGORY_ID);
GO
CREATE INDEX CREDITCARD_INDEX 
  ON BLC_CREDIT_CARD_PAYMENT (REFERENCE_NUMBER);
GO
CREATE INDEX CUSTOMER_USERNAME_INDEX 
  ON BLC_CUSTOMER (USER_NAME);
GO
CREATE INDEX CUSTOMER_EMAIL_INDEX 
  ON BLC_CUSTOMER (EMAIL_ADDRESS);
GO
CREATE INDEX CUSTOMER_CHALLENGE_INDEX 
  ON BLC_CUSTOMER (CHALLENGE_QUESTION_ID);
GO
CREATE INDEX CUSTOMERADDRESS_CUSTOMER_INDEX 
  ON BLC_CUSTOMER_ADDRESS (CUSTOMER_ID);
GO
CREATE INDEX CUSTOMERADDRESS_ADDRESS_INDEX 
  ON BLC_CUSTOMER_ADDRESS (ADDRESS_ID);
GO
CREATE INDEX CUSTOMERADDRESS_NAME_INDEX 
  ON BLC_CUSTOMER_ADDRESS (ADDRESS_NAME);
GO
CREATE INDEX CUSTOFFERXREF_CUSTOMER_INDEX 
  ON BLC_CUSTOMER_OFFER_XREF (CUSTOMER_ID);
GO
CREATE INDEX CUSTOFFERXREF_OFFER_INDEX 
  ON BLC_CUSTOMER_OFFER_XREF (OFFER_ID);
GO
CREATE INDEX CUSTPHONE_CUSTOMER_INDEX 
  ON BLC_CUSTOMER_PHONE (CUSTOMER_ID);
GO
CREATE INDEX CUSTPHONE_PHONE_INDEX 
  ON BLC_CUSTOMER_PHONE (PHONE_ID);
GO
CREATE INDEX CUSTPHONE_NAME_INDEX 
  ON BLC_CUSTOMER_PHONE (PHONE_NAME);
GO
CREATE INDEX CUSTROLE_ROLE_INDEX 
  ON BLC_CUSTOMER_ROLE (ROLE_ID);
GO
CREATE INDEX DISCRETE_ORDERITEM_INDEX 
  ON BLC_DISCRETE_ORDER_ITEM (ORDER_ITEM_ID);
GO
CREATE INDEX DISCRETE_BUNDLE_INDEX 
  ON BLC_DISCRETE_ORDER_ITEM (BUNDLE_ORDER_ITEM_ID);
GO
CREATE INDEX DISCRETE_PRODUCT_INDEX 
  ON BLC_DISCRETE_ORDER_ITEM (PRODUCT_ID);
GO
CREATE INDEX DISCRETE_SKU_INDEX 
  ON BLC_DISCRETE_ORDER_ITEM (SKU_ID);
GO
CREATE INDEX EMAILTRACKING_INDEX 
  ON BLC_EMAIL_TRACKING (EMAIL_ADDRESS);
GO
CREATE INDEX TRACKINGCLICKS_CUSTOMER_INDEX 
  ON BLC_EMAIL_TRACKING_CLICKS (CUSTOMER_ID);
GO
CREATE INDEX TRACKINGCLICKS_TRACKING_INDEX 
  ON BLC_EMAIL_TRACKING_CLICKS (EMAIL_TRACKING_ID);
GO
CREATE INDEX TRACKINGOPENS_INDEX 
  ON BLC_EMAIL_TRACKING_OPENS (EMAIL_TRACKING_ID);
GO
CREATE INDEX FGADJUSTMENT_INDEX 
  ON BLC_FG_ADJUSTMENT (FULFILLMENT_GROUP_ID);
GO
CREATE INDEX FGADJUSTMENT_OFFER_INDEX 
  ON BLC_FG_ADJUSTMENT (OFFER_ID);
GO
CREATE INDEX FG_PRIMARY_INDEX 
  ON BLC_FULFILLMENT_GROUP (IS_PRIMARY);
GO
CREATE INDEX FG_REFERENCE_INDEX 
  ON BLC_FULFILLMENT_GROUP (REFERENCE_NUMBER);
GO
CREATE INDEX FG_ADDRESS_INDEX 
  ON BLC_FULFILLMENT_GROUP (ADDRESS_ID);
GO
CREATE INDEX FG_ORDER_INDEX 
  ON BLC_FULFILLMENT_GROUP ();
GO
CREATE INDEX FG_MESSAGE_INDEX 
  ON BLC_FULFILLMENT_GROUP (PERSONAL_MESSAGE_ID);
GO
CREATE INDEX FG_PHONE_INDEX 
  ON BLC_FULFILLMENT_GROUP (PHONE_ID);
GO
CREATE UNIQUE INDEX FGITEM_ORDER_INDEX 
  ON BLC_FULFILLMENT_GROUP_ITEM (ORDER_ITEM_ID);
GO
CREATE INDEX FGITEM_FG_INDEX 
  ON BLC_FULFILLMENT_GROUP_ITEM (FULFILLMENT_GROUP_ID);
GO
CREATE INDEX GIFTCARD_INDEX 
  ON BLC_GIFT_CARD_PAYMENT (REFERENCE_NUMBER);
GO
CREATE INDEX OFFER_DELIVERY_INDEX 
  ON BLC_OFFER (OFFER_DELIVERY_TYPE);
GO
CREATE INDEX OFFER_NAME_INDEX 
  ON BLC_OFFER (OFFER_NAME);
GO
CREATE INDEX OFFER_TYPE_INDEX 
  ON BLC_OFFER (OFFER_TYPE);
GO
CREATE INDEX OFFERCODE_OFFER_INDEX 
  ON BLC_OFFER_CODE (OFFER_ID);
GO
CREATE INDEX OFFERCODE_CODE_INDEX 
  ON BLC_OFFER_CODE (OFFER_CODE);
GO
CREATE INDEX ORDER_CUSTOMER_INDEX 
  ON BLC_ORDER (CUSTOMER_ID);
GO
CREATE INDEX ORDER_NAME_INDEX 
  ON BLC_ORDER (NAME);
GO
CREATE INDEX ORDER_NUMBER_INDEX 
  ON BLC_ORDER (ORDER_NUMBER);
GO
CREATE INDEX ORDER_STATUS_INDEX 
  ON BLC_ORDER (ORDER_STATUS);
GO
CREATE INDEX ORDERADJUST_OFFER_INDEX 
  ON BLC_ORDER_ADJUSTMENT (OFFER_ID);
GO
CREATE INDEX OFFERADJUST_ORDER_INDEX 
  ON BLC_ORDER_ADJUSTMENT (ORDER_ID);
GO
CREATE INDEX ORDERITEM_TYPE_INDEX 
  ON BLC_ORDER_ITEM (ORDER_ITEM_TYPE);
GO
CREATE INDEX ORDERITEM_CATEGORY_INDEX 
  ON BLC_ORDER_ITEM (CATEGORY_ID);
GO
CREATE INDEX ORDERITEM_GIFT_INDEX 
  ON BLC_ORDER_ITEM (GIFT_WRAP_ITEM_ID);
GO
CREATE INDEX ORDERITEM_MESSAGE_INDEX 
  ON BLC_ORDER_ITEM (PERSONAL_MESSAGE_ID);
GO
CREATE INDEX OIADJUST_OFFER_INDEX 
  ON BLC_ORDER_ITEM_ADJUSTMENT (OFFER_ID);
GO
CREATE INDEX OIADJUST_ORDERITEM_INDEX 
  ON BLC_ORDER_ITEM_ADJUSTMENT (ORDER_ITEM_ID);
GO
CREATE INDEX ORDEROCXREF_ORDER_INDEX 
  ON BLC_ORDER_OFFER_CODE_XREF (ORDER_ID);
GO
CREATE INDEX ORDEROCEXREF_OC_INDEX 
  ON BLC_ORDER_OFFER_CODE_XREF (OFFER_CODE_ID);
GO
CREATE INDEX ORDERPAYMENT_REFERENCE_INDEX 
  ON BLC_ORDER_PAYMENT (REFERENCE_NUMBER);
GO
CREATE INDEX ORDERPAYMENT_ADDRESS_INDEX 
  ON BLC_ORDER_PAYMENT (ADDRESS_ID);
GO
CREATE INDEX ORDERPAYMENT_ORDER_INDEX 
  ON BLC_ORDER_PAYMENT (ORDER_ID);
GO
CREATE INDEX ORDERPAYMENT_PHONE_INDEX 
  ON BLC_ORDER_PAYMENT (PHONE_ID);
GO
CREATE INDEX PAYMENTLOG_CUSTOMER_INDEX 
  ON BLC_PAYMENT_LOG (CUSTOMER_ID);
GO
CREATE INDEX PAYMENTLOG_ORDERPAYMENT_INDEX 
  ON BLC_PAYMENT_LOG (ORDER_PAYMENT_ID);
GO
CREATE INDEX PAYRESPONSE_REFERENCE_INDEX 
  ON BLC_PAYMENT_RESPONSE_ITEM (REFERENCE_NUMBER);
GO
CREATE INDEX PAYRESPONSE_CUSTOMER_INDEX 
  ON BLC_PAYMENT_RESPONSE_ITEM (CUSTOMER_ID);
GO
CREATE INDEX PAYRESPONSE_ORDERPAYMENT_INDEX 
  ON BLC_PAYMENT_RESPONSE_ITEM (ORDER_PAYMENT_ID);
GO
CREATE INDEX PRODUCT_NAME_INDEX 
  ON BLC_PRODUCT (NAME);
GO
CREATE INDEX PRODUCT_CATEGORY_INDEX 
  ON BLC_PRODUCT (DEFAULT_CATEGORY_ID);
GO
CREATE INDEX PRODATTRIBUTE_INDEX 
  ON BLC_PRODUCT_ATTRIBUTE (PRODUCT_ID);
GO
CREATE INDEX CROSSSALE_INDEX 
  ON BLC_PRODUCT_CROSS_SALE (PRODUCT_ID);
GO
CREATE INDEX PRODFEATURED_CATEGORY_INDEX 
  ON BLC_PRODUCT_FEATURED (CATEGORY_ID);
GO
CREATE INDEX PRODFEATURED_PRODUCT_INDEX 
  ON BLC_PRODUCT_FEATURED (PRODUCT_ID);
GO
CREATE INDEX PRODSKUXREF_PRODUCT_INDEX 
  ON BLC_PRODUCT_SKU_XREF (PRODUCT_ID);
GO
CREATE INDEX PRODSKUXREF_SKU_INDEX 
  ON BLC_PRODUCT_SKU_XREF (SKU_ID);
GO
CREATE INDEX SHIPPINGRATE_FEESUB_INDEX 
  ON BLC_SHIPPING_RATE (FEE_SUB_TYPE);
GO
CREATE INDEX SHIPPINGRATE_FEE_INDEX 
  ON BLC_SHIPPING_RATE (FEE_TYPE);
GO
CREATE INDEX SKU_NAME_INDEX 
  ON BLC_SKU (NAME);
GO
CREATE INDEX SKU_ACTIVE_INDEX 
  ON BLC_SKU (ACTIVE_START_DATE, ACTIVE_END_DATE);
GO
CREATE INDEX SKU_AVAILABLE_INDEX 
  ON BLC_SKU (AVAILABLE_FLAG);
GO
CREATE INDEX SKU_DISCOUNTABLE_INDEX 
  ON BLC_SKU (DISCOUNTABLE_FLAG);
GO
CREATE INDEX SKU_TAXABLE_INDEX 
  ON BLC_SKU (TAXABLE_FLAG);
GO
CREATE INDEX SKUATTR_NAME_INDEX 
  ON BLC_SKU_ATTRIBUTE (NAME);
GO
CREATE INDEX SKUATTR_SKU_INDEX 
  ON BLC_SKU_ATTRIBUTE (SKU_ID);
GO
CREATE INDEX SKUAVAIL_STATUS_INDEX 
  ON BLC_SKU_AVAILABILITY (AVAILABILITY_STATUS);
GO
CREATE INDEX SKUAVAIL_LOCATION_INDEX 
  ON BLC_SKU_AVAILABILITY (LOCATION_ID);
GO
CREATE INDEX SKUAVAIL_SKU_INDEX 
  ON BLC_SKU_AVAILABILITY (SKU_ID);
GO
CREATE INDEX TARGETCONTENT_NAME_INDEX 
  ON BLC_TARGET_CONTENT (CONTENT_NAME);
GO
CREATE INDEX TARGETCONTEXT_TYPE_INDEX 
  ON BLC_TARGET_CONTENT (CONTENT_TYPE);
GO
CREATE INDEX USER_NAME_INDEX 
  ON BLC_USER (USER_NAME);
GO
CREATE INDEX USER_EMAIL_INDEX 
  ON BLC_USER (EMAIL_ADDRESS);
GO
CREATE INDEX USERROLE_ROLE_INDEX 
  ON BLC_USER_ROLE (ROLE_ID);
GO
CREATE INDEX USERROLE_USER_INDEX 
  ON BLC_USER_ROLE (USER_ID);
GO
CREATE INDEX OFFERAUDIT_CUSTOMER_INDEX 
  ON OFFER_AUDIT (CUSTOMER_ID);
GO
CREATE INDEX OFFERAUDIT_OFFERCODE_INDEX 
  ON OFFER_AUDIT (OFFER_CODE_ID);
GO
CREATE INDEX OFFERAUDIT_TYPE_INDEX 
  ON OFFER_AUDIT (OFFER_TYPE);
GO
CREATE INDEX OFFERAUDIT_RELATED_INDEX 
  ON OFFER_AUDIT (RELATED_ID);
GO
CREATE INDEX OFFERAUDIT_OFFER_INDEX 
  ON OFFER_AUDIT (OFFER_ID);
GO
CREATE INDEX SEQUENCEGEN_INDEX 
  ON SEQUENCE_GENERATOR (ID_NAME);
