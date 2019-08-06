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
public class XxPromotion extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private LocalDateTime createDate;

    private LocalDateTime modifyDate;

    private Long version;

    private Integer orders;

    private LocalDateTime beginDate;

    private LocalDateTime endDate;

    private String image;

    private String introduction;

    private Boolean isCouponAllowed;

    private Boolean isFreeShipping;

    private BigDecimal maximumPrice;

    private Integer maximumQuantity;

    private BigDecimal minimumPrice;

    private Integer minimumQuantity;

    private String name;

    private String pointExpression;

    private String priceExpression;

    private String title;


}
