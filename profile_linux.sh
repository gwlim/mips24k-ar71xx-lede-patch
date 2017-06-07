#!/bin/bash
set -e
sed -i 's|# CONFIG_ARCH_HAS_GCOV_PROFILE_ALL is not set|CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y|' ./target/linux/ar71xx/config-4.4
sed -i 's|# CONFIG_GCOV is not set|CONFIG_GCOV=y|' ./target/linux/generic/config-4.4
sed -i 's|# CONFIG_GCOV_KERNEL is not set|CONFIG_GCOV_KERNEL=y|' ./target/linux/generic/config-4.4
sed -i '1192i\CONFIG_GCOV_FORMAT_AUTODETECT=y' ./target/linux/generic/config-4.4
sed -i 's|TARGET_LDFLAGS:=-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib|TARGET_LDFLAGS:=-L$(STAGING_DIR)/usr/lib -L$(STAGING_DIR)/lib -lgcov --coverage|' ./rules.mk