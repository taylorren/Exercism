namespace hellmath
{

    // TODO: Task 1 - Define an `AccountStatus` enumeration to represent the four
    // account types: `troll`, `guest`, `user`, and `mod`.
    enum class AccountStatus
    {
        troll,
        guest,
        user,
        mod
    };

    // TODO: Task 1 - Define an `Action` enumeration to represent the three
    // permission types: `read`, `write`, and `remove`.
    enum class Action
    {
        read,
        write,
        remove
    };
    // TODO: Task 2 - Implement the `display_post` function, that gets two arguments
    // of `AccountStatus` and returns a `bool`. The first argument is the status of
    // the poster, the second one is the status of the viewer.
    bool display_post(AccountStatus poster, AccountStatus viewer)
    {
        bool ok = false;
        if (poster == AccountStatus::troll)
        {
            if (viewer == AccountStatus::troll)
            {
                ok = true;
            }
        }
        else
        {
            ok = true;
        }

        return ok;
    }

    // TODO: Task 3 - Implement the `permission_check` function, that takes an
    // `Action` as a first argument and an `AccountStatus` to check against. It
    // should return a `bool`.
    bool permission_check(Action action, AccountStatus account)
    {
        bool ok = false;
        switch (account)
        {
        case AccountStatus::troll:
            ok = (action != Action::remove);
            break;
        case AccountStatus::guest:
            ok = (action == Action::read);
            break;
        case AccountStatus::user:
            ok = (action != Action::remove);
            break;
        case AccountStatus::mod:
            ok = true;
            break;
        default:
            break;
        }

        return ok;
    }

    // TODO: Task 4 - Implement the `valid_player_combination` function that
    // checks if two players can join the same game. The function has two parameters
    // of type `AccountStatus` and returns a `bool`.

    bool valid_player_combination(AccountStatus s1, AccountStatus s2)
    {
        bool ok = false;
        switch (s1)
        {
        case AccountStatus::troll:
            ok = (s2 == AccountStatus::troll);
            break;
        case AccountStatus::user:
        case AccountStatus::mod:
            ok = (s2 == AccountStatus::user || s2 == AccountStatus::mod);
            break;
        default:
            break;
        }

        return ok;
    }

    // TODO: Task 5 - Implement the `has_priority` function that takes two
    // `AccountStatus` arguments and returns `true`, if and only if the first
    // account has a strictly higher priority than the second.
    bool has_priority(AccountStatus s1, AccountStatus s2)
    {
        return s1>s2;
    }

} // namespace hellmath