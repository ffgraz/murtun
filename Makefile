#    Copyright (C) 2013-2015 Christian Pointner <equinox@ffgraz.net>
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
#    The full GNU General Public License is included in this distribution in
#    the file called "COPYING".

include $(TOPDIR)/rules.mk

PKG_NAME:=murtun
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/murtun
  SECTION:=net
  CATEGORY:=Network
  TITLE:=mur.at Tunnel Setup scripts for Funkfeuer Graz
  DEPENDS:=+kmod-ipv6 +kmod-sit +kmod-iptunnel4 +kmod-ipip +ip +olsrd
  MAINTAINER:= Christian Pointner <equinox@ffgraz.net>
endef

define Package/murtun/description
	mur.at Tunnel Setup scripts for Funkfeuer Graz
endef

define Package/murtun/conffiles
	/etc/config/murtun
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/murtun/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/murtun.config $(1)/etc/config/murtun
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/murtun-prepare $(1)/etc/init.d/murtun-prepare
	$(INSTALL_BIN) ./files/murtun $(1)/etc/init.d/murtun
endef

$(eval $(call BuildPackage,murtun))
