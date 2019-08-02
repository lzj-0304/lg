package com.lotbyte.lg.service;

import com.lotbyte.lg.entity.XxNavigation;
import com.lotbyte.lg.common.service.BaseService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-02
 */
public interface XxNavigationService extends BaseService<XxNavigation> {
    public List<XxNavigation> queryXxNavigationsByPosition(Integer position);

}
