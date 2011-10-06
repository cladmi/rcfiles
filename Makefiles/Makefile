ifndef FREERTOS_PATH
$(error Please set environment variable FREERTOS_PATH to the FreeRTOS folder)
endif
ifndef WSN430_DRIVERS_PATH
$(error Please set environment variable WSN430_DRIVERS_PATH to the drivers folder)
endif
SOURCE_PATH = $(FREERTOS_PATH)/Source
PORT_PATH = $(FREERTOS_PATH)/Source/portable/GCC/MSP430F449


NAMES  = tdma_adc_node_cc1100  tdma_adc_sink_cc1100
NAMES += tdma_adc_node_cc2420  tdma_adc_sink_cc2420



# intermediate variables for target specific files
SRC_tdma_adc_node  = node_main.c adc.c
SRC_tdma_adc_node += $(FREERTOS_PATH)/lib/mac/tdma/tdma_node.c
SRC_tdma_adc_sink  = sink_main.c printer.c
SRC_tdma_adc_sink += $(FREERTOS_PATH)/lib/mac/tdma/tdma_coord.c
SRC_tdma_adc_sink += $(FREERTOS_PATH)/lib/mac/tdma/tdma_table.c

SRC_cc1100  = $(WSN430_DRIVERS_PATH)/cc1100.c $(FREERTOS_PATH)/lib/phy/phy_cc1100.c
SRC_cc2420  = $(WSN430_DRIVERS_PATH)/cc2420.c $(FREERTOS_PATH)/lib/phy/phy_cc2420.c


# targets specific sources
SRC_tdma_adc_node_cc1100 = $(SRC_tdma_adc_node) $(SRC_cc1100)
SRC_tdma_adc_node_cc2420 = $(SRC_tdma_adc_node) $(SRC_cc2420)
SRC_tdma_adc_sink_cc1100 = $(SRC_tdma_adc_sink) $(SRC_cc1100)
SRC_tdma_adc_sink_cc2420 = $(SRC_tdma_adc_sink) $(SRC_cc2420)


# common sources
SRC  = $(SOURCE_PATH)/tasks.c
SRC += $(SOURCE_PATH)/list.c
SRC += $(SOURCE_PATH)/queue.c
SRC += $(SOURCE_PATH)/portable/MemMang/heap_1.c
SRC += $(PORT_PATH)/port.c
SRC += $(WSN430_DRIVERS_PATH)/uart0.c
SRC += $(WSN430_DRIVERS_PATH)/timerB.c
SRC += $(WSN430_DRIVERS_PATH)/spi1.c
SRC += $(WSN430_DRIVERS_PATH)/clock.c
SRC += $(WSN430_DRIVERS_PATH)/ds2411.c



INCLUDES  = -I. -I$(WSN430_DRIVERS_PATH) -I$(SOURCE_PATH)/include
INCLUDES += -I$(FREERTOS_PATH)/lib/mac/tdma
INCLUDES += -I$(FREERTOS_PATH)/lib/phy


-include Makefile.common

