################################################################################
#
# ockamd
#
################################################################################

OCKAMD_VERSION = v0.10.1
OCKAMD_SOURCE = foo-$(FOO_VERSION).tar.gz
OCKAMD_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
OCKAMD_LICENSE = "Apache License 2.0"
OCKAMD_LICENSE_FILES = LICENSE

OCKAMD_DEPENDENCIES = host-rustc

OCKAMD_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo



$(eval $(generic-package))