package com.lotbyte.lg.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.lotbyte.lg.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class XxGoods extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private LocalDateTime createDate;

    private LocalDateTime modifyDate;

    private Long version;

    private String attributeValue0;

    private String attributeValue1;

    private String attributeValue10;

    private String attributeValue11;

    private String attributeValue12;

    private String attributeValue13;

    private String attributeValue14;

    private String attributeValue15;

    private String attributeValue16;

    private String attributeValue17;

    private String attributeValue18;

    private String attributeValue19;

    private String attributeValue2;

    private String attributeValue3;

    private String attributeValue4;

    private String attributeValue5;

    private String attributeValue6;

    private String attributeValue7;

    private String attributeValue8;

    private String attributeValue9;

    private String caption;

    private Integer generateMethod;

    private Long hits;

    private String image;

    private String introduction;

    private Boolean isDelivery;

    private Boolean isList;

    private Boolean isMarketable;

    private Boolean isTop;

    private String keyword;

    private BigDecimal marketPrice;

    private String memo;

    private Long monthHits;

    private LocalDateTime monthHitsDate;

    private Long monthSales;

    private LocalDateTime monthSalesDate;

    private String name;

    private String parameterValues;

    private BigDecimal price;

    private String productImages;

    private Long sales;

    private Float score;

    private Long scoreCount;

    private String seoDescription;

    private String seoKeywords;

    private String seoTitle;

    private String sn;

    private String specificationItems;

    private Long totalScore;

    private Integer type;

    private String unit;

    private Long weekHits;

    private LocalDateTime weekHitsDate;

    private Long weekSales;

    private LocalDateTime weekSalesDate;

    private Integer weight;

    private Long brand;

    private Long productCategory;


}
