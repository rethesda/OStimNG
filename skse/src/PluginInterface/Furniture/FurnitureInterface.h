#pragma once

#include "FurnitureType.h"

#include "../PluginInterface.h"

namespace OStim {
    class FurnitureInterface : public PluginInterface {
    public:
        inline static const char* NAME = "Furniture";

        // --- ABI version 0x07050003 --- //
        virtual FurnitureType* getType(const char* id) = 0;
    };
}