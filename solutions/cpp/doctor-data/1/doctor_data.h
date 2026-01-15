#include <string>

namespace star_map
{
    enum class System
    {
        BetaHydri,
        Sol,
        EpsilonEridani,
        AlphaCentauri,
        DeltaEridani,
        Omicron2Eridani
    };
}

namespace heaven
{
    class Vessel
    {
    public:
        Vessel(std::string name="", int gen=1, star_map::System system=star_map::System::Sol);
        Vessel replicate(std::string name="");

        int generation, busters;
        std::string name;
        star_map::System current_system;
        void make_buster();
        bool shoot_buster();
    };
    std::string get_older_bob(Vessel v1, Vessel v2);
    bool in_the_same_system(Vessel v1, Vessel v2);
} // namespace heaven
