package com.lotbyte.lg.entity;

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
 * @since 2019-08-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class XxAd extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private LocalDateTime createDate;

    private LocalDateTime modifyDate;

    private Long version;

    private Integer orders;

    private LocalDateTime beginDate;

    private String content;

    private LocalDateTime endDate;

    private String path;

    private String title;

    private Integer type;

    private String url;

    private Long adPosition;


}
