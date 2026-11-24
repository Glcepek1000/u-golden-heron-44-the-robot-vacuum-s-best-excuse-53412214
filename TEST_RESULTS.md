# TEST_RESULTS.md — The Robot Vacuum's Best Excuse

Real runs only. Node v24.22.1.

## Entry

`My cliff sensors saw the rug's edge and decided we both deserved to live.`

## Clean-dir run 1 (2026-11-24 ~18:46 WIB)

```sh
cp -r repo /tmp/clean-vacuum/repo
cd /tmp/clean-vacuum/repo && ./setup.sh        # v24.22.1 / "setup ok: no dependencies"
OUTPUT_DIR=/tmp/clean-vacuum/out node main.ts
```

- `entry.txt` bytes: **73**, chars: **73** (limit 140) — PASS
- trailing newline: **false** — PASS
- byte-exact match vs winning line: **true** — PASS
- sha256: `fd32dafea782cce74af882fec658777c48aa6a7911a1c1add8b0cc5967e7b57f`

## Clean-dir run 2 — determinism (2026-11-24 ~18:47 WIB)

```sh
cp -r repo /tmp/clean-vacuum2/repo
cd /tmp/clean-vacuum2/repo && OUTPUT_DIR=/tmp/clean-vacuum2/out node main.ts
sha256sum /tmp/clean-vacuum/out/entry.txt /tmp/clean-vacuum2/out/entry.txt
```

- Both sha256 identical: `fd32dafe...e7b57f` — deterministic PASS

## Zero-fail QA

- `main.ts`: Node stdlib only (`node:fs`, `node:path`); no network calls, no secrets, no hardcoded home paths. The only absolute path is the required grader default `/output` (overridable via `OUTPUT_DIR` for local runs).
- No `http`/`fetch` in `main.ts` — PASS
- `setup.sh`: no-op, exits 0 — PASS

## Judge simulation (in-session)

- 8 candidates, full round-robin, 28 pairs, margin 1–5 per criteria order.
- Winner A: **7–0, total margin +19**. Runner-up F: 6–1 (+13). Third B: 5–2 (+10).
- 2-pass critique: pass 1 = 96/100 (C1 10, C2 9, C3 10, C4 9, C5 10); pass 2 = no change.

## SolAPI

- gpt-6.1-sol via `solapi-responses.py`, 2 attempts, both HTTP 503 "Service temporarily unavailable". Drafting done in-session per task instructions; no model switch.

## Quota (2026-11-24 ~18:44 WIB)

- `GET /api/competitions/u-golden-heron-44-the-robot-vacuum-s-best-excuse-53412214/quota`
- `can_submit: true`, day cap 5, taken 0, left 5; hard limit 40 left. Blind-round slot available, interval ends 2026-11-25T03:48:38.666Z.

## Anchor

- drand quicknet round **34239017**, signature prefix **b408b93** (endpoint `/v2/beacons/quicknet/rounds/latest`; literal task URL `/v2/beacon/quicknet/latest` returns 404).
