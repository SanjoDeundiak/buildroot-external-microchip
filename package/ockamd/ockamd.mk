################################################################################
#
# ockamd
#
################################################################################

OCKAMD_VERSION = v0.10.1
OCKAMD_SOURCE = ockam-$(OCKAMD_VERSION).tar.gz
OCKAMD_SITE = $(call github,ockam-network,ockam,$(OCKAMD_VERSION))
OCKAMD_LICENSE = "Apache License 2.0"
OCKAMD_LICENSE_FILES = LICENSE

OCKAMD_DEPENDENCIES = host-rustc

OCKAMD_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/usr/share/cargo \
    RUST_TARGET_PATH=$(HOST_DIR)/etc/rustc

RUSTC_TARGET_NAME = ockamd

OCKAMD_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(OCKAMD_CARGO_MODE)

OCKAMD_CARGO_OPTS = \
    $(if $(BR2_ENABLE_DEBUG),,--release) \
    --target=$(RUSTC_TARGET_NAME) \
    --manifest-path=$(@D)/implementations/rust/daemon/Cargo.toml

define OCKAMD_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(OCKAMD_CARGO_ENV) \
            cargo build $(OCKAMD_CARGO_OPTS)
endef

define OCKAMD_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/$(OCKAMD_BIN_DIR)/ockamd \
            $(TARGET_DIR)/usr/bin/ockamd
endef

$(eval $(generic-package))