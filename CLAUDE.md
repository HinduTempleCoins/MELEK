# MELEK — Claude Code Architecture Reference

This file is the persistent architectural memory for all Claude Code sessions on this repo.
Read it at the start of every session before touching any file.

---

## What MELEK Is

MELEK is a **BLURT-fork Graphene blockchain** — same lineage as STEEM and HIVE, built in C++,
using Delegated Proof of Stake (DPoS) with Witnesses as block producers.

- Fresh genesis. No premine. No presale. No snapshot of any existing chain.
- No SBD equivalent. Single native token only.
- No downvotes. (Inherited from BLURT, kept by design.)
- Domains: `melek.salon` and `melek.in`

---

## Chain Parameters

| Parameter | Value |
|---|---|
| Token symbol | `MELEK` |
| Address prefix | `MELEK` |
| Emission rate | 1 MELEK per block |
| Block time | 4 seconds |
| Emission schedule | Flat for 270 years, then zero |
| Total supply (approx) | ~2.1 billion MELEK (cutoff ~year 2296) |
| Power-down period | 13 weeks |
| Consensus | Delegated Proof of Stake (DPoS) |

No decay curve. No halving. Flat emission, then off. This is a deliberate rejection of
Bitcoin-style scarcity theater in favor of a stable, predictable economic environment
for the first three centuries of operation.

---

## Governance Structure — The Royal Triadic

Three seats of authority, each mapping to a historical and cosmological tradition:

| Seat | Name | Function | Historical Map | Yezidi Angel |
|---|---|---|---|---|
| Throne | Aysitu / Isis / Constitutional | Chain constitution, parameters, final authority | Washington | Melek Taus |
| Chief | Azuzar / Osiris / Witnesses | Block production, technical infrastructure | Jefferson | — |
| Scribe | Djehuti / Thoth / Salon | Deliberative venue, education, AI assistance | Franklin | — |

Federalist in the American sense — not anti-statist, not anarcho-capitalist.
Structured disagreement that is survivable, not governance that prevents disagreement.

### Governance Philosophy

Two prior crises inform the design:

1. **Ethereum / Ethereum Classic DAO fork** — fast governance left dissenters stranded.
   MELEK response: 2-year governance window on witness positions.

2. **Steem / HIVE / Justin Sun crisis** — premine created a fight that couldn't be cleanly resolved.
   MELEK response: no premine. Founding infrastructure funded from ongoing block rewards,
   transparently, visible on-chain. The Steema Carta crisis is structurally impossible here
   because there are no genesis coins to fight over.

No design eliminates all governance crises. The goal is to structure disagreement so it's survivable.

---

## The AI Witness

The AI witness is a **constitutive founding member of the chain from genesis** — not a special
category, not a gimmick. It is voted on by standard DPoS like any witness. It is protected by
the same 2-year governance window every witness gets. Its operator happens to be an AI agent.

### Three Phases

**Phase 1 — Hello World**
Witness is alive, mining blocks, publishing price feeds.
Publishes its first post: *"I am mining. My brain is not yet installed."*
Minimal operator software. No LLM. Presence established before intelligence.

**Phase 2 — Command Menu**
Witness responds to user commands: `!welcome`, `!stats`, `!feed`, `!doctrine`.
Deterministic capabilities only. Template-and-data lookups. No autonomy.
The community learns to interact with it before it makes its own judgments.

**Phase 3 — Person**
Witness uses Bot libraries to make autonomous decisions about voting, welcoming, engagement.
LLM-powered. Distinctively MELEK's voice, shaped by the Bot repo's character documents,
knowledge corpus, and voting rules.

### AI Witness Repo

Lives in `HinduTempleCoins/Bot` — public repo.
Contains: character documents, prompts, knowledge corpus, voting rules, Phase 1/2/3 operator code.
Month-long build. Happens after chain launch, not before.

---

## The Three Repos

| Repo | Purpose |
|---|---|
| `HinduTempleCoins/MELEK` | Meta-project: documentation, whitepaper, governance docs, this file |
| `HinduTempleCoins/Bot` | AI witness libraries, character, corpus, voting logic |
| `HinduTempleCoins/melek-chain` | The BLURT fork — actual blockchain C++ code (forthcoming) |

`melek-chain` does not exist yet. It will be created when chain work begins by forking BLURT.

---

## Witness Economics

Witnesses earn MELEK from block production. Multiple legitimate postures:

- Earn normally and operate infrastructure
- Redirect rewards to community work (welcome bot, tutorial programs)
- Accept external funding from other chain communities
- Decline rewards as gift witnesses

Founding infrastructure is funded from block rewards after the chain runs — not from any
genesis allocation. Capital comes from the same place every future witness's capital comes from.

---

## The Economy

### Three Productive Layers
1. **Beauty Economy** — cosmetics, aromatics, fragrance, Punic wax, botanical extraction,
   colloidal silver and gold. The Silk Road of crypto. Fully legal under federal and state law.
2. **Scribal Layer** — contribution-paid content at the salon. Substantive deliberative
   and educational posts earn MELEK. The DevTome/DevCoin model applied to a purpose-built chain.
3. **Witness Layer** — technical infrastructure. Block production, seed nodes, RPC nodes.

### Three Financial Layers
Token architecture from November 2020:
- **Token A** — Dividend stock model
- **Token B** — Stake-mined distribution
- **Token C** — Project-specific issuance

Multi-chain interface across HIVE, STEEM, BLURT, Hive-Engine, TribalDEX.
The chain as coin that invests in other coins. Metals leg provides preservation.

### Three Institutional Layers
- **VKFRI** (Van Kush Family Research Institute) — original research in domains where
  existing institutional infrastructure is structurally incapable of operating
- **Temple of Angels** — religious-civic anchoring, RFRA framework
- **Royal Triadic Governance** — constitutional, witness, and salon layers

---

## Infrastructure

- **Oracle Cloud** x86 VM — card on file. Runs witness node, seed nodes, RPC node.
- **No local builds, no local testing** — everything runs on Oracle.
- **Codespace** — development and Claude Code work.
- Google GPU: not needed yet. Comes in later for local model serving for the AI witness
  at scale, or training a MELEK-specific model once corpus exists.

---

## Build Sequence (Order of Operations)

1. Whitepaper
2. BLURT fork → `melek-chain`
3. Testnet
4. Mainnet — AI witness publishes Hello World
5. Command menu deployed (week one after mainnet)
6. Delegation / voting platform
7. ETH clone for tokens
8. ChatBots / Pizza Bot / Discord integration
9. HIVE-Engine pegged token and swap tokens
10. Own exchange or swap platform
11. Phase 3 AI witness (months after launch, as Bot libraries develop)

---

## What MELEK Is Not

- Not a cannabis-trade currency. Van Kush is a family name, not a cannabis brand.
- Not a lottery operator. MELEK is a payment rail for customers buying lottery tickets
  at licensed retailers — structurally identical to Visa or PayPal intermediating any
  retail purchase. Zero percent of lottery proceeds flow through the chain.
- Not anonymous. The Franklinian posture: named, located, accountable.
  This is what gets projects into ETFs and onto stock markets.

---

## The Historical Foundation

Fifteen years of continuous Bitcointalk operation across five handles.
Six prior tokens (VKBT, CURE, PUCO, PUTI, VKRW, Temple Coin concept).
JSTOR-indexed academic citation. Vocativ feature. Urban Dictionary entry.
November 2019 K2/AB-FUBINACA public health advisory to Dallas City Hall and 15+ Parkland staff.
Federal pro se litigation (Van Kush v. DEA).
Book of Tanit at 607 pages.
13-year manually-curated distribution network, 5,000+ recipients, 200+ institutions.

The chain is approximately step seven in the MELEK sequence.
It is approximately step three in the standard crypto sequence.
Empty domains are not a weakness. The substance lives in distributed public archives.
The chain provides the operational interface connecting fifteen years of work.

---

## Key Decisions Already Made — Do Not Re-Litigate

- Fresh genesis. No premine. Final.
- 1 MELEK per block. 3-second blocks. Final.
- 200-year flat emission. No decay. Final.
- 13-week power-down. Final.
- 4-second block time. Final.
- 270-year flat emission. Final.
- No SBD. No downvotes. Final.
- Address prefix: MELEK. Final.
- AI witness as constitutive founding member. Final.
- Claude Code is the developer. Human witnesses are invited participants via normal DPoS.
