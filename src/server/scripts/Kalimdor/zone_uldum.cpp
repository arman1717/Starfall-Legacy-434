﻿
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "PassiveAI.h"
#include "SpellScript.h"
#include "MoveSplineInit.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Pet.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "Vehicle.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "Player.h"

// Quest 28250: Thieving Little Pluckers
class spell_uldum_hammer : public SpellScriptLoader
{
    public:
        spell_uldum_hammer() : SpellScriptLoader("spell_uldum_hammer") { }

        class spell_uldum_hammer_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_uldum_hammer_SpellScript);

            void HandleDummy1(SpellEffIndex /*effIndex*/)
            {
                if (Unit* caster = GetCaster())
                    if (Unit* target = GetHitCreature())
                    {
                        if (target->GetEntry() == 48040 && !target->isDead())
                        {
                            float ori = frand(0.0f, M_PI);
                            caster->Kill(target);
                            target->GetMotionMaster()->MoveKnockbackFrom(caster->GetPositionX()+cos(ori)*10, caster->GetPositionY()+sin(ori)*10, 10.0f, 5.0f);
                            caster->ToPlayer()->KilledMonsterCredit(48105);
                            target->ToCreature()->DespawnOrUnsummon(7000);
                        }
                    }
            }

            void HandleDummy2(SpellEffIndex /*effIndex*/)
            {
                if (Unit* caster = GetCaster())
                    if (Unit* target = GetHitCreature())
                    {
                        if (target->GetEntry() == 48041 && !target->isDead())
                        {
                            float ori = frand(0.0f, M_PI);
                            caster->Kill(target);
                            target->GetMotionMaster()->MoveKnockbackFrom(caster->GetPositionX()+cos(ori)*10, caster->GetPositionY()+sin(ori)*10, 10.0f, 5.0f);
                            caster->ToPlayer()->KilledMonsterCredit(48105);
                            target->ToCreature()->DespawnOrUnsummon(7000);
                        }
                    }
            }

            void HandleDummy3(SpellEffIndex /*effIndex*/)
            {
                if (Unit* caster = GetCaster())
                    if (Unit* target = GetHitCreature())
                    {
                        if (target->GetEntry() == 48043 && !target->isDead())
                        {
                            float ori = frand(0.0f, M_PI);
                            caster->Kill(target);
                            target->GetMotionMaster()->MoveKnockbackFrom(caster->GetPositionX()+cos(ori)*10, caster->GetPositionY()+sin(ori)*10, 10.0f, 5.0f);
                            caster->ToPlayer()->KilledMonsterCredit(48105);
                            target->ToCreature()->DespawnOrUnsummon(7000);
                        }
                    }
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_uldum_hammer_SpellScript::HandleDummy1, EFFECT_0, SPELL_EFFECT_DUMMY);
                OnEffectHitTarget += SpellEffectFn(spell_uldum_hammer_SpellScript::HandleDummy2, EFFECT_1, SPELL_EFFECT_DUMMY);
                OnEffectHitTarget += SpellEffectFn(spell_uldum_hammer_SpellScript::HandleDummy3, EFFECT_2, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_uldum_hammer_SpellScript();
        }
};

class npc_lady_humps_intro_uldum : public CreatureScript
{
public:
    npc_lady_humps_intro_uldum() : CreatureScript("npc_lady_humps_intro_uldum") { }

    enum questId
    {
        QUEST_ENTRY_EASY_MONEY  = 27003
    };

    enum spellId
    {
        // On Preparation
        SPELL_PLAYER_PREP           = 86750,
        SPELL_INIT_ULDUM_INTRO      = 86748,

        // After Preparation
        SPELL_REVERSE_MIRROR_IMAGE  = 86783,
        SPELL_PLAYER_SUMMON_CAMERA  = 95747,
        SPELL_PING_CAMERA_00        = 86815,
        SPELL_COPY_MAINHAND         = 41054,
        SPELL_COPY_OFFHAND          = 45205,

        // Phasing Final Preparation
        PLAYER_PHASE_INTRO          = 298,
        SPELL_CAMERA_BUNNY_2        = 86792,
        SPELL_PING_CAMERA_01        = 86815,
        SPELL_ULDUM_CAMERA_BUNNY_04 = 86822
    };

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (player->GetQuestStatus(QUEST_ENTRY_EASY_MONEY) == QUEST_STATUS_INCOMPLETE)
        {
            player->CastSpell(player, SPELL_PLAYER_PREP, true);
            player->CastWithDelay(1500, player, SPELL_INIT_ULDUM_INTRO, true);
            return true;
        }
        return false;
    }
};

class spell_uldum_intro_preparation : public SpellScriptLoader
{
    public:
        spell_uldum_intro_preparation() : SpellScriptLoader("spell_uldum_intro_preparation") { }

        enum spellId
        {
            // On Preparation
            SPELL_PLAYER_UNIQUE_PHASING = 60191,
            SPELL_SUMMON_CLONED_IMAGE   = 86782,
            SPELL_SUMMON_ADARRAH        = 86751,
            SPELL_SUMMON_CARAVAN        = 86752,
            SPELL_SUMMON_ADARRAH_CAMEL  = 86758,
            SPELL_SUMMON_MACK_CAMEL     = 86757,
            SPELL_SUMMON_SAMIR_CAMEL    = 86756,
            SPELL_SUMMON_BUDD_CAMEL     = 86755,
            SPELL_SUMMON_PACK_MULE      = 86754,
            SPELL_SUMMON_LADY_HUMPS     = 86753,
            SPELL_SUMMON_BEAM_BUNNY     = 86942,
            SPELL_SUMMON_CAMERA_BUNNY   = 86792,

            // After Preparation
            SPELL_REVERSE_MIRROR_IMAGE  = 86783,
            SPELL_PLAYER_SUMMON_CAMERA  = 95747,
            SPELL_PING_CAMERA_00        = 86815,
            SPELL_COPY_MAINHAND         = 41054,
            SPELL_COPY_OFFHAND          = 45205,

            // Phasing Final Preparation
            PLAYER_PHASE_INTRO          = 298,
            SPELL_CAMERA_BUNNY_2        = 86792,
            SPELL_PING_CAMERA_01        = 86815,
            SPELL_ULDUM_CAMERA_BUNNY_04 = 86822
        };

        class spell_uldum_intro_preparation_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_uldum_intro_preparation_SpellScript);

            void OnPreparePlayer()
            {
                if (Unit* caster = GetCaster())
                {
                    if (caster->GetTypeId() != TYPEID_PLAYER)
                        return;

                    caster->AddAura(SPELL_PLAYER_UNIQUE_PHASING, caster);
                    caster->SetPhaseMask(298, true);
                    caster->CastSpell(caster, SPELL_SUMMON_CLONED_IMAGE);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_CAMERA_BUNNY, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_ADARRAH, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_CARAVAN, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_ADARRAH_CAMEL, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_MACK_CAMEL, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_SAMIR_CAMEL, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_BUDD_CAMEL, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_PACK_MULE, true);
                    caster->CastWithDelay(1600, caster, SPELL_SUMMON_LADY_HUMPS, true);
                    caster->CastWithDelay(1600, caster, SPELL_PING_CAMERA_00, true);
                }
            }

            void Register()
            {
                AfterCast += SpellCastFn(spell_uldum_intro_preparation_SpellScript::OnPreparePlayer);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_uldum_intro_preparation_SpellScript();
        }
};

class npc_uldum_intro_selfmirror : public CreatureScript
{
public:
    npc_uldum_intro_selfmirror() : CreatureScript("npc_uldum_intro_selfmirror") { }

    enum spellId
    {
        SPELL_CAST_MIRROR_IMAGE_AURA    = 86784,
        SPELL_CAST_COPY_MAINHAND        = 41054,
        SPELL_CAST_COPY_OFFHAND         = 45205,
        SPELL_UNIQUE_PHASING            = 60191,
        SPELL_RIDE_CARAVAN              = 63313
    };

    enum eventId
    {
        EVENT_CHANGE_ORIENTATION    = 1,
        EVENT_MOVE_AND_EMOTE,
        EVENT_MOVE_NEAR_CARAVAN_01,
        EVENT_MOVE_NEAR_CARAVAN_02,
        EVENT_CARAVAN_JUMPON
    };

    enum actionId
    {
        ACTION_SET_ORIENTATION  = 1
    };

    enum pointId
    {
        POINT_ADARRAH           = 1,
        POINT_ADARRAH_CAMEL,
        POINT_NEAR_CARAVAN_01,
        POINT_NEAR_CARAVAN_02
    };

    enum npcId
    {
        NPC_ENTRY_PLAYER_CAMERA     = 46557,
        NPC_ENTRY_CARAVAN           = 46596,
        NPC_ENTRY_LADY_HUMPS        = 46536,
        NPC_ENTRY_ADARRAH_CAMEL     = 46546,
        NPC_ENTRY_MACK_CAMEL        = 46543,
        NPC_ENTRY_BUDD_CAMEL        = 46538,
        NPC_ENTRY_PACK_MULE         = 46537,
        NPC_ENTRY_SAMIR_CAMEL       = 46540
    };

    struct npc_uldum_intro_selfmirrorAI : public ScriptedAI
    {
        npc_uldum_intro_selfmirrorAI(Creature* creature) : ScriptedAI(creature) { }

        EventMap events;

        void IsSummonedBy(Unit* owner)
        {
            owner->CastSpell(me, SPELL_CAST_MIRROR_IMAGE_AURA, true);
            owner->CastSpell(me, SPELL_CAST_COPY_MAINHAND, true);
            owner->CastSpell(me, SPELL_CAST_COPY_OFFHAND, true);
            owner->AddAura(SPELL_UNIQUE_PHASING, me);
            me->SetWalk(true);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
            events.ScheduleEvent(EVENT_CHANGE_ORIENTATION, 4000);
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_CHANGE_ORIENTATION:
                    {
                        events.CancelEvent(EVENT_CHANGE_ORIENTATION);
                        me->GetMotionMaster()->MovePoint(POINT_ADARRAH, -8926.66f, -2265.75f, 8.87f);
                        events.ScheduleEvent(EVENT_MOVE_AND_EMOTE, 14500);
                        me->SetOrientation(0.35f);
                        break;
                    }
                    case EVENT_MOVE_AND_EMOTE:
                    {
                        events.CancelEvent(EVENT_MOVE_AND_EMOTE);
                        me->GetMotionMaster()->MovePoint(POINT_ADARRAH_CAMEL, -8928.12f, -2268.30f, 8.87f);
                        me->SetOrientation(3.55f);
                        break;
                    }
                    case EVENT_MOVE_NEAR_CARAVAN_01:
                    {
                        me->SetWalk(false);
                        events.CancelEvent(EVENT_MOVE_NEAR_CARAVAN_01);
                        me->GetMotionMaster()->MovePoint(POINT_NEAR_CARAVAN_01, -8919.12f, -2272.86f, 8.88f);
                        break;
                    }
                    case EVENT_MOVE_NEAR_CARAVAN_02:
                    {
                        events.CancelEvent(EVENT_MOVE_NEAR_CARAVAN_02);
                        me->GetMotionMaster()->MovePoint(POINT_NEAR_CARAVAN_02, -8922.04f, -2286.32f, 8.90f);
                        if (Creature* buddCamel = me->FindNearestCreature(NPC_ENTRY_BUDD_CAMEL, 100.0f, true))
                            buddCamel->AI()->DoAction(1);
                        break;
                    }
                    case EVENT_CARAVAN_JUMPON:
                    {
                        events.CancelEvent(EVENT_CARAVAN_JUMPON);
                        if (Creature* caravan = me->FindNearestCreature(NPC_ENTRY_CARAVAN, 100.0f, true))
                            me->CastSpell(caravan, SPELL_RIDE_CARAVAN);
                        break;
                    }
                    default:
                        break;
                }
            }
        }

        void MovementInform(uint32 type, uint32 pointId)
        {
            if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
               return;

            switch (pointId)
            {
                case POINT_ADARRAH_CAMEL:
                {
                    me->HandleEmoteCommand(EMOTE_ONESHOT_TALK);
                    if (Creature* playerCamera = me->FindNearestCreature(NPC_ENTRY_PLAYER_CAMERA, 100.0f, true))
                        playerCamera->AI()->DoAction(1);
                    events.ScheduleEvent(EVENT_MOVE_NEAR_CARAVAN_01, 3500);
                    break;
                }
                case POINT_NEAR_CARAVAN_01:
                {
                    if (Creature* ladyHumps = me->FindNearestCreature(NPC_ENTRY_LADY_HUMPS, 100.0f, true))
                        ladyHumps->AI()->DoAction(1);
                    if (Creature* uldumCaravan = me->FindNearestCreature(NPC_ENTRY_CARAVAN, 100.0f, true))
                        uldumCaravan->AI()->DoAction(1);
                    if (Creature* adarrahCamel = me->FindNearestCreature(NPC_ENTRY_ADARRAH_CAMEL, 100.0f, true))
                        adarrahCamel->AI()->DoAction(1);
                    if (Creature* mackCamel = me->FindNearestCreature(NPC_ENTRY_MACK_CAMEL, 100.0f, true))
                        mackCamel->AI()->DoAction(1);
                    if (Creature* packMule = me->FindNearestCreature(NPC_ENTRY_PACK_MULE, 100.0f, true))
                        packMule->AI()->DoAction(1);
                    if (Creature* samirCamel = me->FindNearestCreature(NPC_ENTRY_SAMIR_CAMEL, 100.0f, true))
                        samirCamel->AI()->DoAction(1);
                    events.ScheduleEvent(EVENT_MOVE_NEAR_CARAVAN_02, 4000);
                    break;
                }
                case POINT_NEAR_CARAVAN_02:
                {
                    if (Creature* playerCamera = me->FindNearestCreature(NPC_ENTRY_PLAYER_CAMERA, 100.0f, true))
                        playerCamera->AI()->DoAction(2);
                    me->GetMotionMaster()->MovementExpired(false);
                    if (Creature* uldumCaravan = me->FindNearestCreature(NPC_ENTRY_CARAVAN, 100.0f, true))
                        me->GetMotionMaster()->MoveJump(uldumCaravan->GetPositionX(), uldumCaravan->GetPositionY(), uldumCaravan->GetPositionZ(), 10.0f, 10.0f);
                    events.ScheduleEvent(EVENT_CARAVAN_JUMPON, 2000);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_uldum_intro_selfmirrorAI(creature);
    }
};

class npc_uldum_intro_camera01 : public CreatureScript
{
public:
    npc_uldum_intro_camera01() : CreatureScript("npc_uldum_intro_camera01") { }

    enum spellId
    {
        SPELL_RIDE_CAMERA           = 46598,
        SPELL_SWITCH_SEAT_2         = 63313,
        SPELL_FADE_TO_BLACK         = 89404,
        SPELL_SUMMON_SKARF          = 87012
    };

    enum actionId
    {
        ACTION_FOCUS_IMAGE  = 1,
        ACTION_MOVE_TO
    };

    enum pointId
    {
        POINT_TAKE_Z            = 1,
        POINT_BEHIND_CARAVAN,
        POINT_REMOVE_Z,
        POINT_MIDDLE,
        POINT_RIDGE
    };

    enum eventId
    {
        EVENT_BEHIND_CARAVAN    = 1,
        EVENT_SWITCH_SEAT,
        EVENT_FADE_TO_BLACK,
        EVENT_UPPER_VISUAL,
        EVENT_RETURN_SEAT,
        EVENT_SEAT_UNDER_ATTACK
    };

    enum npcId
    {
        NPC_ENTRY_MIRROR_IMAGE      = 46554,
        NPC_ENTRY_ULDUM_CARAVAN     = 46596,
        NPC_ENTRY_PLAYER_CAMERA     = 46557,
        NPC_ENTRY_CARAVAN           = 46596,
        NPC_ENTRY_LADY_HUMPS        = 46536,
        NPC_ENTRY_ADARRAH_CAMEL     = 46546,
        NPC_ENTRY_MACK_CAMEL        = 46543,
        NPC_ENTRY_BUDD_CAMEL        = 46538,
        NPC_ENTRY_PACK_MULE         = 46537,
        NPC_ENTRY_SAMIR_CAMEL       = 46540,
        NPC_ENTRY_SULTAN_OOGAH      = 46680
    };

    struct npc_uldum_intro_camera01AI : public ScriptedAI
    {
        npc_uldum_intro_camera01AI(Creature* creature) : ScriptedAI(creature) {playerOwner = NULL;}

        EventMap events;

        void OnCharmed(bool apply) {}

        void IsSummonedBy(Unit* owner)
        {
            playerOwner = owner;
            me->AddUnitState(UNIT_STATE_ROTATING);
            me->SetFacingToObject(owner);
            owner->EnterVehicle(me, 0);
        };

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_FOCUS_IMAGE:
                {
                    me->GetMotionMaster()->MoveJump(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()+6.0f, 3.0f, 3.0f, POINT_TAKE_Z);
                    break;
                }
                case ACTION_MOVE_TO:
                {
                    me->GetMotionMaster()->MovementExpired(false);
                    me->GetMotionMaster()->MoveJump(-8926.18f, -1747.56f, 80.56f, 5.0f, 20.0f, POINT_MIDDLE);
                    break;
                }
                default:
                    break;
            }
        }

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_BEHIND_CARAVAN:
                    {
                        events.CancelEvent(EVENT_BEHIND_CARAVAN);
                        me->GetMotionMaster()->MovementExpired(false);
                        me->GetMotionMaster()->MoveJump(me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()-6.0f, 4.0f, 4.0f, POINT_REMOVE_Z);
                        events.ScheduleEvent(EVENT_UPPER_VISUAL, 13000);
                        events.ScheduleEvent(EVENT_FADE_TO_BLACK, 16000);
                        events.ScheduleEvent(EVENT_SWITCH_SEAT, 18000);
                        events.ScheduleEvent(EVENT_RETURN_SEAT, 25000);
                        break;
                    }
                    case EVENT_UPPER_VISUAL:
                    {
                        events.CancelEvent(EVENT_UPPER_VISUAL);
                        if (playerOwner && playerOwner != NULL && playerOwner->GetVehicleBase())
                            playerOwner->GetVehicle()->GetPassenger(0)->ChangeSeat(2, true);
                        break;
                    }
                    case EVENT_SWITCH_SEAT:
                    {
                        events.CancelEvent(EVENT_SWITCH_SEAT);
                        if (playerOwner && playerOwner != NULL && playerOwner->GetVehicleBase())
                            playerOwner->GetVehicle()->GetPassenger(2)->ChangeSeat(1, true);

                        me->GetMotionMaster()->MovementExpired(false);
                        me->NearTeleportTo(-8937.54f,-1725.59f, 125.31f, 2.09f);
                        break;
                    }
                    case EVENT_FADE_TO_BLACK:
                    {
                        if (playerOwner && playerOwner != NULL)
                            playerOwner->CastSpell(playerOwner, SPELL_FADE_TO_BLACK, true);

                        if (Creature* ladyHumps = me->FindNearestCreature(NPC_ENTRY_LADY_HUMPS, 100.0f, true))
                            ladyHumps->AI()->DoAction(2);
                        if (Creature* uldumCaravan = me->FindNearestCreature(NPC_ENTRY_CARAVAN, 100.0f, true))
                            uldumCaravan->AI()->DoAction(2);
                        if (Creature* adarrahCamel = me->FindNearestCreature(NPC_ENTRY_ADARRAH_CAMEL, 100.0f, true))
                            adarrahCamel->AI()->DoAction(2);
                        if (Creature* mackCamel = me->FindNearestCreature(NPC_ENTRY_MACK_CAMEL, 100.0f, true))
                            mackCamel->AI()->DoAction(2);
                        if (Creature* packMule = me->FindNearestCreature(NPC_ENTRY_PACK_MULE, 100.0f, true))
                            packMule->AI()->DoAction(2);
                        if (Creature* samirCamel = me->FindNearestCreature(NPC_ENTRY_SAMIR_CAMEL, 100.0f, true))
                            samirCamel->AI()->DoAction(2);
                        if (Creature* buddCamel = me->FindNearestCreature(NPC_ENTRY_BUDD_CAMEL, 100.0f, true))
                            buddCamel->AI()->DoAction(2);
                        break;
                    }
                    case EVENT_RETURN_SEAT:
                    {
                        events.CancelEvent(EVENT_RETURN_SEAT);
                        events.ScheduleEvent(EVENT_SEAT_UNDER_ATTACK, 6000);
                        if (playerOwner && playerOwner != NULL && playerOwner->GetVehicleBase())
                            playerOwner->GetVehicle()->GetPassenger(1)->ChangeSeat(0, true);
                        break;
                    }
                    case EVENT_SEAT_UNDER_ATTACK:
                    {
                        events.CancelEvent(EVENT_SEAT_UNDER_ATTACK);
                        if (playerOwner && playerOwner != NULL && playerOwner->GetVehicleBase())
                        {
                            playerOwner->CastSpell(playerOwner, SPELL_SUMMON_SKARF, true);
                            playerOwner->GetVehicle()->GetPassenger(0)->ChangeSeat(2, true);
                        }
                        me->GetMotionMaster()->MovementExpired(false);
                        me->GetMotionMaster()->MoveJump(-8992.04f, -1663.47f, 108.99f, 45.0f, 45.0f, POINT_RIDGE);
                        break;
                    }
                    default:
                        break;
                }
            }
        }

        void MovementInform(uint32 type, uint32 pointId)
        {
            if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
               return;

            switch (pointId)
            {
                case POINT_TAKE_Z:
                {
                    me->GetMotionMaster()->MoveJump(-8930.42f, -2307.52f, me->GetPositionZ()+2.0f, 35.0f, 35.0f, POINT_BEHIND_CARAVAN);
                    break;
                }
                case POINT_BEHIND_CARAVAN:
                {
                    me->SetFacingTo(1.33f);
                    events.ScheduleEvent(EVENT_BEHIND_CARAVAN, 3000);
                    break;
                }
                default:
                    break;
            }
        }

    protected:
        Unit* playerOwner;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_uldum_intro_camera01AI(creature);
    }
};

class npc_adarrah_uldum_intro : public CreatureScript
{
public:
    npc_adarrah_uldum_intro() : CreatureScript("npc_adarrah_uldum_intro") { }

    enum npcId
    {
        NPC_ADARRAH_CAMEL   = 46546
    };

    enum eventId
    {
        EVENT_START_TALK    = 1,
        EVENT_MOVE_TO_CAMEL
    };

    enum pointId
    {
        POINT_TO_PLAYER = 1,
        POINT_TO_CAMEL
    };

    struct npc_adarrah_uldum_introAI : public ScriptedAI
    {
        npc_adarrah_uldum_introAI(Creature* creature) : ScriptedAI(creature) {playerOwner = NULL;}

        EventMap events;

        void IsSummonedBy(Unit* owner)
        {
            playerOwner = owner;
            events.ScheduleEvent(EVENT_START_TALK, 2000);
        };

        void UpdateAI(uint32 diff)
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_START_TALK:
                    {
                        events.CancelEvent(EVENT_START_TALK);
                        if (playerOwner && playerOwner != NULL)
                        {
                            Talk(0, playerOwner->GetGUID());
                            me->HandleEmoteCommand(EMOTE_ONESHOT_TALK);
                            TalkWithDelay(7000, 1, playerOwner->GetGUID());
                            playerOwner->SetOrientation(0.33f);
                            me->GetMotionMaster()->MovePoint(POINT_TO_PLAYER, -8923.89f, -2264.23f, 8.87f);
                            events.ScheduleEvent(EVENT_MOVE_TO_CAMEL, 14000);
                        }
                        break;
                    }
                    case EVENT_MOVE_TO_CAMEL:
                    {
                        me->GetMotionMaster()->MovePoint(POINT_TO_CAMEL, -8937.79f, -2274.36f, 8.88f);
                        events.CancelEvent(EVENT_MOVE_TO_CAMEL);
                        break;
                    }
                    default:
                        break;
                }
            }
        }

        void MovementInform(uint32 type, uint32 pointId)
        {
            if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
               return;

            switch (pointId)
            {
                case POINT_TO_PLAYER:
                {
                    me->HandleEmoteCommand(EMOTE_ONESHOT_TALK);
                    break;
                }
                case POINT_TO_CAMEL:
                {
                    if (Creature* adarrahCamel = me->FindNearestCreature(NPC_ADARRAH_CAMEL, 50.0f))
                        me->EnterVehicle(adarrahCamel, 0);
                    break;
                }
                default:
                    break;
            }
        }

    protected:
        Unit* playerOwner;
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_adarrah_uldum_introAI(creature);
    }
};

class npc_uldum_caravan_intro : public CreatureScript
{
public:
    npc_uldum_caravan_intro() : CreatureScript("npc_uldum_caravan_intro") { }

    struct npc_uldum_caravan_introAI : public npc_escortAI
    {
        npc_uldum_caravan_introAI(Creature* creature) : npc_escortAI(creature) { }

        enum actionId
        {
            ACTION_START_WP = 1,
            ACTION_SPEEDUP
        };

        void OnCharmed(bool apply) {}

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START_WP:
                {
                    Start(false, false, NULL, NULL, false, false, true);
                    SetDespawnAtEnd(false);
                    SetDespawnAtFar(false);
                    break;
                }
                case ACTION_SPEEDUP:
                {
                    me->NearTeleportTo(-8963.29f, -1696.34f, 94.44f, 1.62f);
                    break;
                }
                default:
                    break;
            }
        }

        void WaypointReached(uint32 point)
        {
            switch (point)
            {
                case 3:
                {
                    SetEscortPaused(true);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_uldum_caravan_introAI(creature);
    }
};

class npc_lady_humps_intro_escort : public CreatureScript
{
public:
    npc_lady_humps_intro_escort() : CreatureScript("npc_lady_humps_intro_escort") { }

    struct npc_lady_humps_intro_escortAI : public npc_escortAI
    {
        npc_lady_humps_intro_escortAI(Creature* creature) : npc_escortAI(creature) { }

        enum actionId
        {
            ACTION_START_WP = 1,
            ACTION_SPEEDUP
        };

        void OnCharmed(bool apply) {}

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START_WP:
                {
                    Start(false, false, NULL, NULL, false, false, true);
                    SetDespawnAtEnd(false);
                    SetDespawnAtFar(false);
                    break;
                }
                case ACTION_SPEEDUP:
                {
                    me->NearTeleportTo(-8963.40f, -1681.32f, 94.44f, 1.62f);
                    break;
                }
                default:
                    break;
            }
        }

        void WaypointReached(uint32 point)
        {
            switch (point)
            {
                case 3:
                {
                    SetEscortPaused(true);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_lady_humps_intro_escortAI(creature);
    }
};

class npc_adarrah_camel_intro_escort : public CreatureScript
{
public:
    npc_adarrah_camel_intro_escort() : CreatureScript("npc_adarrah_camel_intro_escort") { }

    struct npc_adarrah_camel_intro_escortAI : public npc_escortAI
    {
        npc_adarrah_camel_intro_escortAI(Creature* creature) : npc_escortAI(creature) { }

        enum actionId
        {
            ACTION_START_WP = 1,
            ACTION_SPEEDUP
        };

        void OnCharmed(bool apply) {}

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START_WP:
                {
                    Start(false, false, NULL, NULL, false, false, true);
                    SetDespawnAtEnd(false);
                    SetDespawnAtFar(false);
                    break;
                }
                case ACTION_SPEEDUP:
                {
                    me->NearTeleportTo(-8972.29f, -1693.71f, 94.45f, 1.62f);
                    break;
                }
                default:
                    break;
            }
        }

        void WaypointReached(uint32 point)
        {
            switch (point)
            {
                case 3:
                {
                    SetEscortPaused(true);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_adarrah_camel_intro_escortAI(creature);
    }
};

class npc_pack_mule_intro_escort : public CreatureScript
{
public:
    npc_pack_mule_intro_escort() : CreatureScript("npc_pack_mule_intro_escort") { }

    struct npc_pack_mule_intro_escortAI : public npc_escortAI
    {
        npc_pack_mule_intro_escortAI(Creature* creature) : npc_escortAI(creature) { }

        enum actionId
        {
            ACTION_START_WP = 1,
            ACTION_SPEEDUP
        };

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START_WP:
                {
                    Start(false, false, NULL, NULL, false, false, true);
                    SetDespawnAtEnd(false);
                    SetDespawnAtFar(false);
                    break;
                }
                case ACTION_SPEEDUP:
                {
                    me->NearTeleportTo(-8955.54f, -1690.98f, 94.45f, 1.62f);
                    break;
                }
                default:
                    break;
            }
        }

        void WaypointReached(uint32 point)
        {
            switch (point)
            {
                case 3:
                {
                    SetEscortPaused(true);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_pack_mule_intro_escortAI(creature);
    }
};

class npc_budd_camel_intro_escort : public CreatureScript
{
public:
    npc_budd_camel_intro_escort() : CreatureScript("npc_budd_camel_intro_escort") { }

    struct npc_budd_camel_intro_escortAI : public npc_escortAI
    {
        npc_budd_camel_intro_escortAI(Creature* creature) : npc_escortAI(creature) { }

        EventMap events;

        enum actionId
        {
            ACTION_START_WP = 1,
            ACTION_SPEEDUP
        };

        enum npcId
        {
            NPC_ENTRY_BUDD  = 46520
        };

        void OnCharmed(bool apply) {}

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START_WP:
                {
                    Start(false, false, NULL, NULL, false, false, true);
                    if (Creature* budd = me->FindNearestCreature(NPC_ENTRY_BUDD, 5.0f, true))
                        budd->AI()->TalkWithDelay(2000, 0);
                    SetDespawnAtEnd(false);
                    SetDespawnAtFar(false);
                    break;
                }
                case ACTION_SPEEDUP:
                {
                    me->NearTeleportTo(-8962.96f, -1715.27f, 94.44f, 1.62f);
                    break;
                }
                default:
                    break;
            }
        }

        void WaypointReached(uint32 point)
        {
            switch (point)
            {
                case 3:
                {
                    SetEscortPaused(true);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_budd_camel_intro_escortAI(creature);
    }
};

class npc_samir_camel_intro_escort : public CreatureScript
{
public:
    npc_samir_camel_intro_escort() : CreatureScript("npc_samir_camel_intro_escort") { }

    struct npc_samir_camel_intro_escortAI : public npc_escortAI
    {
        npc_samir_camel_intro_escortAI(Creature* creature) : npc_escortAI(creature) { }

        EventMap events;

        enum actionId
        {
            ACTION_START_WP = 1,
            ACTION_SPEEDUP
        };

        void OnCharmed(bool apply) {}

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START_WP:
                {
                    Start(false, false, NULL, NULL, false, false, true);
                    SetDespawnAtEnd(false);
                    SetDespawnAtFar(false);
                    break;
                }
                case ACTION_SPEEDUP:
                {
                    me->NearTeleportTo(-8950.76f, -1695.39f, 94.45f, 1.62f);
                    break;
                }
                default:
                    break;
            }
        }

        void WaypointReached(uint32 point)
        {
            switch (point)
            {
                case 3:
                {
                    SetEscortPaused(true);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_samir_camel_intro_escortAI(creature);
    }
};

class npc_mack_camel_intro_escort : public CreatureScript
{
public:
    npc_mack_camel_intro_escort() : CreatureScript("npc_mack_camel_intro_escort") { }

    struct npc_mack_camel_intro_escortAI : public npc_escortAI
    {
        npc_mack_camel_intro_escortAI(Creature* creature) : npc_escortAI(creature) { }

        enum actionId
        {
            ACTION_START_WP = 1,
            ACTION_SPEEDUP
        };

        void OnCharmed(bool apply) {}

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_START_WP:
                {
                    Start(false, false, NULL, NULL, false, false, true);
                    SetDespawnAtEnd(false);
                    SetDespawnAtFar(false);
                    break;
                }
                case ACTION_SPEEDUP:
                {
                    me->NearTeleportTo(-8954.05f, -1704.67f, 94.95f, 1.62f);
                    break;
                }
                default:
                    break;
            }
        }

        void WaypointReached(uint32 point)
        {
            switch (point)
            {
                case 3:
                {
                    SetEscortPaused(true);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_mack_camel_intro_escortAI(creature);
    }
};

class npc_skarf_and_oogah_intro : public CreatureScript
{
public:
    npc_skarf_and_oogah_intro() : CreatureScript("npc_skarf_and_oogah_intro") { }

    struct npc_skarf_and_oogah_introAI : public ScriptedAI
    {
        npc_skarf_and_oogah_introAI(Creature* creature) : ScriptedAI(creature) { }

        enum actionId
        {
            ACTION_JUMP_ON_RIDGE    = 1,
        };

        enum pointId
        {
            POINT_RIDGE         = 1,
            POINT_EXPEDITION
        };

        enum npcId
        {
            NPC_ENTRY_SULTAN_OOGAH  = 46680
        };

        void OnCharmed(bool apply) {}

        void IsSummonedBy(Unit* /*owner*/)
        {
            DoAction(ACTION_JUMP_ON_RIDGE);
        }

        void DoAction(int32 action)
        {
            switch (action)
            {
                case ACTION_JUMP_ON_RIDGE:
                {
                    me->GetMotionMaster()->MoveJump(-9006.12f, -1656.48f, 107.45f, 20.0f, 20.0f, POINT_RIDGE);
                    break;
                }
                default:
                    break;
            }
        }

        void MovementInform(uint32 type, uint32 pointId)
        {
            if (type != POINT_MOTION_TYPE && type != EFFECT_MOTION_TYPE)
               return;

            switch (pointId)
            {
                case POINT_RIDGE:
                {
                    if (Creature* sultanOogah = me->FindNearestCreature(NPC_ENTRY_SULTAN_OOGAH, 10.0f, true))
                        sultanOogah->AI()->TalkWithDelay(2000, 0);
                    break;
                }
                default:
                    break;
            }
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_skarf_and_oogah_introAI(creature);
    }
};

void AddSC_uldum()
{
    new spell_uldum_hammer();
    new npc_lady_humps_intro_uldum();
    new spell_uldum_intro_preparation();
    new npc_uldum_intro_selfmirror();
    new npc_uldum_intro_camera01();
    new npc_adarrah_uldum_intro();
    new npc_uldum_caravan_intro();
    new npc_lady_humps_intro_escort();
    new npc_adarrah_camel_intro_escort();
    new npc_pack_mule_intro_escort();
    new npc_budd_camel_intro_escort();
    new npc_samir_camel_intro_escort();
    new npc_mack_camel_intro_escort();
    new npc_skarf_and_oogah_intro();
}
