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
 * @since 2019-08-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class XxMember extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private LocalDateTime createDate;

    private LocalDateTime modifyDate;

    private Long version;

    private String address;

    private BigDecimal amount;

    private String attributeValue0;

    private String attributeValue1;

    private String attributeValue2;

    private String attributeValue3;

    private String attributeValue4;

    private String attributeValue5;

    private String attributeValue6;

    private String attributeValue7;

    private String attributeValue8;

    private String attributeValue9;

    private BigDecimal balance;

    private LocalDateTime birth;

    private String email;

    private Integer gender;

    private Boolean isEnabled;

    private Boolean isLocked;

    private String lockKey;

    private LocalDateTime lockedDate;

    private LocalDateTime loginDate;

    private Integer loginFailureCount;

    private String loginIp;

    private String loginPluginId;

    private String mobile;

    private String name;

    private String nickname;

    private String openId;

    private String password;

    private String phone;

    private Long point;

    private String registerIp;

    private LocalDateTime safeKeyExpire;

    private String safeKeyValue;

    private String username;

    private String zipCode;

    private Long area;

    private Long memberRank;


}
