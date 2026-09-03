#pragma once

import std.time;

namespace auto type {

    /**
        A 64 bit Unix time value
    */
    using time64_t = u64 [[format("type::impl::format_time_t")]];

    namespace impl {

        fn format_time_t(u128 value) {
            u128 value_s = value / 1'000'000;
            return std::time::format(std::time::to_utc(value_s));
        };

    }

}
