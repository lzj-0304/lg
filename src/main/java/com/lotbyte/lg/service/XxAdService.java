package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.entity.XxAd;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-02
 */
public interface XxAdService extends BaseService<XxAd> {
    public List<XxAd> queryAdListByType(Integer type,Integer position);

}
