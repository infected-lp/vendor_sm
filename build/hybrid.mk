# Copyright (C) 2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Hybrid toolchain mode default to on.
ifeq ($(strip $(TARGET_ARCH)),arm)
  ifneq ($(filter 4.9% 5.2%,$(SM_AND_NAME)),)
    ifeq ($(filter 5.2%,$(SM_AND_NAME)),)
      ifeq (1,$(words $(filter $(GCC_4_8_MODULES), $(LOCAL_MODULE))))
        LOCAL_CC := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8/bin/arm-linux-androideabi-gcc$(HOST_EXECUTABLE_SUFFIX)
        LOCAL_CXX := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8/bin/arm-linux-androideabi-g++
      endif
    else
      ifeq (1,$(words $(filter $(GCC_4_8_MODULES), $(LOCAL_MODULE))))
        LOCAL_CC := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8/bin/arm-linux-androideabi-gcc$(HOST_EXECUTABLE_SUFFIX)
        LOCAL_CXX := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8/bin/arm-linux-androideabi-g++
      endif
      ifeq (1,$(words $(filter $(GCC_4_9_MODULES), $(LOCAL_MODULE))))
        LOCAL_CC := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-gcc$(HOST_EXECUTABLE_SUFFIX)
        LOCAL_CXX := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-g++
      endif
    endif
  endif
endif
