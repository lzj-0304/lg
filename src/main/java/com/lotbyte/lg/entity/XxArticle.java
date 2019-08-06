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
 * @since 2019-08-06
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class XxArticle extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private LocalDateTime createDate;

    private LocalDateTime modifyDate;

    private Long version;

    private String author;

    private String content;

    private Integer generateMethod;

    private Long hits;

    private Boolean isPublication;

    private Boolean isTop;

    private String seoDescription;

    private String seoKeywords;

    private String seoTitle;

    private String title;

    private Long articleCategory;


}
