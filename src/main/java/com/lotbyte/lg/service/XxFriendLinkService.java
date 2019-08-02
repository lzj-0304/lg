package com.lotbyte.lg.service;

import com.lotbyte.lg.common.service.BaseService;
import com.lotbyte.lg.entity.XxFriendLink;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lotbyte
 * @since 2019-08-02
 */
public interface XxFriendLinkService extends BaseService<XxFriendLink> {
    public List<XxFriendLink> queryXxFriendLinks(Integer type);

}
