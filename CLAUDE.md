# Memory

## Me
Sumanth, robotics researcher. Current focus: data-driven verification of black-box robotic systems with black-box controllers.

## Research Interests

**Source of truth: `interests_database.csv`** — This CSV is the authoritative, dynamic record of all research interests. Both scheduled tasks (Mode 1 and Mode 2) read this file at the start of each run to determine what to search for and how to filter/rank papers. Do NOT hardcode interest lists in prompts or rely on memory files for filtering — always read this CSV.

→ Static reference (for human reading): memory/context/research-interests.md

## Preferences
- Email source: Google Scholar alerts
- Wants papers prioritized/filtered by interests above
- Remove duplicates across alerts
- Group papers thematically
- Maintain a database (CSV) of processed papers
- Final presentation: static website (dark mode, Google News-style grouped cards)

---

# Working Modes

This project operates in two modes. Both share the same deduplication, filtering, grouping, and database update steps — they differ only in how papers are sourced.

Both modes write to a **single unified database** (`papers_database.csv`). The `source_mode` column tracks provenance and can be:
- `"email"` — found via Google Scholar alerts only
- `"web_survey"` — found via web survey only
- `"email,web_survey"` — found by both (prefer email as primary source)

## Mode 1: Google Scholar Email Digest
- Read Google Scholar alert emails from Gmail
- Extract paper titles, authors, links
- **CRITICAL: Every paper MUST have a URL.** Google Scholar alert emails contain links for each paper — extract them. If a link is missing from the email, search for the paper on Google Scholar or arXiv to find it. Never leave the `url` column empty.
- Generate a **headline takeaway** for each paper (stored in DB)
- Deduplicate, filter, group, and present
## Mode 2: Weekly Web Survey
- Systematically search the sources below for papers from the last 1–3 months
- Follow the search methodology defined in this document
- **CRITICAL: Every paper MUST have a URL.** Always include the direct link (arXiv, DOI, conference page, etc.). Never leave the `url` column empty.
- Generate a **headline takeaway** for each paper (stored in DB)
- Deduplicate against existing DB entries; if a paper already exists from email, update `source_mode` to `"email,web_survey"` (don't create a duplicate)

## Website / UI

The website (`index.html`) has three tabs:
- **"Recent Works"** (default): shows ALL papers in the database
- **"Email Digest"**: shows only papers where `source_mode` contains `"email"`
- **"Interests"**: shows all interests from `interests_database.csv`, grouped by category (Application Areas / Methods). Suggested interests show Approve/Dismiss buttons. When the user clicks a button, the status updates in-memory and a "Save CSV" button appears to download the updated file for replacement.

Papers appear in both paper tabs if their `source_mode` is `"email,web_survey"`.

The website dynamically reads `papers_database.csv` and `interests_database.csv` using PapaParse at load time. No build step is needed — just update the CSVs and refresh the page. All three files must be in the same folder.

### GitHub Sync Scripts

Two scripts manage the canonical database state on GitHub:

- **`pull_from_github.sh`** — Fetches the latest `papers_database.csv`, `interests_database.csv`, and `groups_database.csv` from GitHub and updates local files if the remote is newer. Uses HTTPS + `.github_token`. Run at the **start** of every task (Step 0) to avoid working with stale data. Exits non-zero on failure.
- **`sync_to_github.sh`** — Commits and pushes the updated CSVs (and `index.html`) to GitHub after a run completes. Run at the **end** of every task (Step 10). Requires `.github_token` file in the project directory.

The token file (`.github_token`) is gitignored and must be present locally for both scripts to work.

### Serving

A `launchd` daemon (`com.scholar-dashboard.plist`) runs `python3 -m http.server 80` bound to localhost from this folder. It starts on boot and auto-restarts if it crashes. `/etc/hosts` maps `scholar.local` to `127.0.0.1`.

- **URL**: `http://scholar.local`
- **Install**: `./install_server.sh` (one-time, requires sudo for hosts + port forward)
- **Uninstall**: `./uninstall_server.sh`
- **Logs**: `/tmp/scholar-dashboard.log`, `/tmp/scholar-dashboard.err`

---

# Web Survey — Sources & Methodology

## Tier 1: Robotics Conferences (check for accepted/published paper lists)

| Conference | Typical Timeline | What to Check |
|------------|-----------------|---------------|
| **ICRA** | Acceptances ~Jan–Mar, conference ~May | Accepted paper list, proceedings |
| **IROS** | Conference ~Oct, proceedings after | Recent proceedings |
| **RSS** | Conference ~Jul, acceptances ~Apr | Accepted paper list |
| **CoRL** | Conference ~Nov, proceedings after | Recent proceedings |

## Tier 2: ML Conferences (robotics-relevant papers only)

| Conference | Typical Timeline | What to Check |
|------------|-----------------|---------------|
| **NeurIPS** | Conference ~Dec, proceedings after | Recent proceedings, robot/control track |
| **ICML** | Acceptances ~Apr, conference ~Jul | Accepted paper list |
| **ICLR** | Conference ~May, acceptances ~Jan | Accepted paper list |
| **L4DC** | Conference ~Jun | Accepted paper list |

Focus on: robotics applications, control theory + learning, safety/verification, diffusion/flow models for control, conformal prediction.

## Tier 2.5: Workshops (venues vary year to year)

Workshops are held alongside major conferences or independently. They change every year, so there is no fixed list of venues. Instead, when running a web survey:

1. **Search for recent workshops** by querying for workshops co-located with the Tier 1 and Tier 2 conferences above (e.g., "ICRA 2026 workshops", "NeurIPS 2025 workshops")
2. **Filter by topic relevance** — look for workshops whose titles/themes overlap with the research interests (verification, safe learning, diffusion policies, conformal prediction, foundation models for robotics, etc.)
3. **Check workshop proceedings/websites** for accepted papers or contributed talks

Examples of recurring workshop themes to watch for (names and exact venues change):
- Safe robot learning / safety in learning-based control
- Diffusion models for decision-making / planning
- Foundation models for robotics
- Formal methods meets learning
- Distribution-free uncertainty quantification
- Data-driven control and verification

Since workshops are inherently ephemeral, don't maintain a fixed list — discover them fresh each survey cycle.

## Tier 3: Journals (recent issues, rolling publications)

| Journal | Abbreviation | Notes |
|---------|-------------|-------|
| **IEEE Robotics and Automation Letters** | RA-L | Rolling, bimonthly |
| **International Journal of Robotics Research** | IJRR | Monthly |
| **IEEE Transactions on Robotics** | T-RO | Bimonthly |
| **Transactions on Robot Learning** | T-RL | Newer venue |

## Tier 4: Arxiv (preprints, most up-to-date)

Run targeted searches grouped by research interest:

### Search Clusters

| Cluster | Search Keywords |
|---------|----------------|
| **Verification & safety** | "data-driven verification" robot, "black-box verification" control, reachability learned systems, safety guarantees robot |
| **Conformal prediction + robotics** | conformal prediction robot, distribution-free guarantees control, conformal prediction planning |
| **Visuomotor policy verification** | verification visuomotor policy, certifying vision-based control, testing neural robot policy |
| **Diffusion / flow matching policies** | diffusion policy robot, flow matching imitation learning, diffusion model manipulation |
| **Generalist robot policies** | generalist robot policy, foundation model robotics manipulation, multi-task robot learning |
| **Controller composition** | composing controllers robot, modular policy composition, skill composition robot |
| **Active learning for robotics** | active learning robot verification, sample-efficient robot, active learning control |
| **Imitation & reinforcement learning** | imitation learning manipulation 2026, reinforcement learning locomotion 2026 |

---

# Execution Workflow (both modes)

0. **Pull from GitHub** — **ALWAYS the first step.** Run `bash pull_from_github.sh` from the project directory. This fetches the latest `papers_database.csv` and `interests_database.csv` from GitHub, ensuring the task starts with up-to-date data regardless of what previous sessions pushed. If this script exits non-zero, **abort immediately** and notify the user — do not proceed with stale or missing data.
1. **Load interests** — Read `interests_database.csv` as the sole source of truth for filtering, ranking, and search query construction. Use confirmed interests (status="confirmed") for active filtering; use their `relevance_mapping` column for tier assignment. Ignore rejected interests. Treat suggested interests as "mildly" relevant.
2. **Source** — Gather raw paper list (from emails or web sources above)
3. **Deduplicate** — Remove papers already in the database or appearing multiple times. If a paper exists from a different source, update `source_mode` to reflect both sources.
4. **Filter** — Score/rank by relevance using the confirmed interests from `interests_database.csv` (NOT from memory or hardcoded lists)
5. **Group** — Assign `theme_groups` (pipe-separated) to each paper using the live canonical list from `groups_database.csv` (confirmed entries only, sorted by `display_order`). Default to 1–2 groups; add a third only when the paper makes a genuine, substantial contribution to a third cluster. Hard cap: 5.
   - **If a paper fits an existing confirmed group**, use its exact `group_name` from `groups_database.csv`.
   - **If a paper is genuinely novel and fits no existing group**, create a new row in `groups_database.csv` with `status="suggested"` and a descriptive `group_name`. Assign that group name to the paper. The user will review it in the Interests tab of the website (Approve to confirm, Dismiss to reject). Do NOT fall back to `Other` if the paper clearly represents a new research area — propose the new group instead.
   - **Never invent group name variants** (e.g., "Safe RL", "Diffusion Policies", "Verification & Safety" are all wrong). Use exact `group_name` values from `groups_database.csv`.
   - Current confirmed groups (as of last sync — always re-read from CSV): `Safety & Verification`, `Conformal Prediction`, `Diffusion & Flow Policies`, `VLA & Generalist Policies`, `Imitation Learning`, `Reinforcement Learning`, `Controller Composition`, `Formal Methods & STL`, `Active Learning`, `Planning & Control`.
6. **Fetch metadata & abstract** — For each new paper, visit the paper page (arXiv, conference site, etc.) to extract the **exact title**, **full author list**, **publication date/year**, and **actual abstract** (verbatim, 100-300 words). Store the abstract in the `abstract` column. Do NOT generate or paraphrase the abstract — it must be the real text from the paper.
7. **Generate headline & summary** — From the title + abstract, generate: (a) a concise ~10-15 word headline takeaway for the `headline` column, and (b) a 3-4 sentence summary of the contribution/approach/result for the `summary` column.
8. **Discover new interests** — Identify recurring themes/methods in papers that don't match any existing interest in the database. Add as "suggested" entries to `interests_database.csv` (see Interest Discovery below).
9. **Assign IDs & update databases** — For each new paper, generate a unique `id` using the **Paper ID Format** rules (see below): `{lastname}-{year}-{keyword1}-{keyword2}`, with `-2`/`-3` suffixes for collisions. The `id` must be set before writing the row. Append new papers to `papers_database.csv` (with `id` as the first column) and new suggested interests to `interests_database.csv`.
10. **Sync to GitHub** — Run `bash sync_to_github.sh` to commit and push the updated databases back to GitHub. This is the canonical publish step.
11. **Present** — Share the updated website link with user. If new interests were suggested, mention the Interests tab.

---

# Database Schema

Maintain a CSV file (`papers_database.csv`) with these columns:

| Column | Description |
|--------|-------------|
| `id` | Unique paper ID — see **Paper ID Format** section below. **Always the first column.** |
| `title` | Paper title (use the exact title from the paper, not a paraphrase) |
| `authors` | Author list (extract from the paper page; use "not specified" only as last resort) |
| `venue` | Conference/journal/arxiv |
| `publishing_date` | Publication month and year, e.g. "Mar 2026". Extract from arXiv ID (YYMM), conference date, or journal issue. Fall back to year only if month unknown. |
| `url` | Link to paper |
| `date_found` | Date this paper was added |
| `source_mode` | "email", "web_survey", or "email,web_survey" |
| `relevance_tier` | "definitely", "probably", or "mildly" (from research-interests.md) |
| `theme_groups` | Pipe-separated list of thematic clusters (e.g. `"Safety & Verification\|Conformal Prediction"`). Typically 1–2 groups; up to 5 max for genuinely cross-cutting papers. **Always use canonical group names** — see Step 5 in the Execution Workflow. |
| `headline` | One-line attention-grabbing takeaway (generated, ~10-15 words). Shown as the main display text on the website. |
| `summary` | 3-4 sentence generated summary of the paper's contribution, approach, and key result. Shown on click in the website UI. |
| `abstract` | **The actual abstract from the paper** — fetch from arXiv, conference page, or publisher. Typically 100-300 words. Do NOT generate or paraphrase this; copy the real abstract verbatim. |
| `notes` | **Required triaging note** — always populate this field. Explain why the paper was selected and how it relates to your research interests. Use this format: for email papers, `"Alert: {researcher group(s)}. {Tier} — {one-line reason}"` (e.g., `"Alert: Lindemann/Tomlin. Core — data-driven verification + conformal prediction"`); for web survey papers, `"{Tier} — {one-line reason}"` (e.g., `"High — flow matching applied to visuomotor policy learning"`). Tier values: **Core** (definitely), **High** (probably), **Moderate** (probably/mildly boundary), **Low** (mildly). Never leave blank. |
| `is_read` | `"true"` or `"false"` — set by the user in the dashboard. **Never overwrite** when appending new papers; leave as `"false"` for new rows. |
| `is_starred` | `"true"` or `"false"` — set by the user in the dashboard. **Never overwrite** when appending new papers; leave as `"false"` for new rows. |
| `user_lists` | Pipe-separated (`\|`) list names the user has saved this paper to (e.g. `"reading-list\|important"`). **Never overwrite** when appending new papers; leave empty for new rows. |

---

# Paper ID Format

Every paper in the database must have a unique `id` in the **first column**. IDs are human-readable slugs with a hierarchical tie-breaking scheme:

**Format:** `{lastname}-{year}-{keyword1}-{keyword2}`

| Component | Rules |
|-----------|-------|
| `lastname` | First author's last name, lowercase, ASCII-only, non-alphanumeric chars stripped. Use `unknown` if authors is "not specified". |
| `year` | 4-digit year extracted from `publishing_date` (e.g. `2026` from `"Mar 2026"`). |
| `keyword1`, `keyword2` | First 2 meaningful words from the title, after removing stop words (a, an, the, for, of, with, via, using, in, on, to, and, or, from, by, is, are, be, can, will, has, have, not, but, as, at, new, novel, etc.). Lowercase, ASCII-only. |
| **Tie-breaking** | If the base slug already exists in the DB, append `-2`, `-3`, etc. |

**Examples:**
- `vanwijk-2026-backup-cbf` — "Generalizations of Backup CBFs" by D. van Wijk (2026)
- `ames-2026-safe-locomotion` — "Safe Locomotion via CBFs" by Ames (2026)
- `unknown-2025-conformal-prediction` — paper with no listed authors (2025)
- `unknown-2025-conformal-prediction-2` — a second paper from 2025 with the same slug base

**When generating IDs for new papers:**
1. Build the base slug from `{lastname}-{year}-{keyword1}-{keyword2}`
2. Load the full set of existing IDs from `papers_database.csv`
3. If the base slug is already taken, append `-2`, `-3`, etc. until unique
4. Set the `id` column value **before** appending to the CSV — never leave it empty

---

# Interests Database Schema

Maintain a CSV file (`interests_database.csv`) with these columns:

| Column | Description |
|--------|-------------|
| `interest_name` | Name of the research interest (e.g., "Data-driven verification") |
| `category` | "application" or "method" |
| `priority_level` | "core", "high", "key", "medium", "low-moderate" |
| `relevance_mapping` | "definitely", "probably", or "mildly" — how papers matching this interest should be ranked |
| `status` | "confirmed" (active), "suggested" (pending user review), or "rejected" (dismissed) |
| `related_to` | Other interests or topics this connects to |
| `discovered_from` | How this interest was found: "manual" (user-specified) or paper titles/descriptions |
| `date_added` | Date this interest was first added |
| `date_updated` | Date this interest was last updated (e.g., status change) |
| `notes` | Explanation of why this interest might be relevant |

## Interest Discovery Rules

During each run (Mode 1 or Mode 2), after processing papers:

1. **Identify candidates** — Look for recurring themes, methods, or application areas in the papers that don't match any existing interest in the database (regardless of status).
2. **Threshold** — Only suggest an interest if it appeared in 2+ papers, OR if a single paper is very closely related to existing confirmed interests.
3. **Skip rejected** — Never re-suggest an interest that has status "rejected".
4. **Add to CSV** — Append new suggested interests with `status="suggested"`, best-guess priority and relevance, and a `discovered_from` note explaining which papers triggered it.
5. **User review** — The website's Interests tab shows suggested interests with Approve/Dismiss buttons. When the user clicks a button, the CSV is updated (downloaded for replacement). Future runs respect the updated status.

## How Interests Drive Filtering

The `interests_database.csv` replaces all hardcoded interest lists. The workflow is:

1. Read all rows from `interests_database.csv`
2. Build a lookup: `{ interest_name → relevance_mapping }` for rows where `status = "confirmed"`
3. For each paper, check which confirmed interests it aligns with
4. Assign the highest `relevance_mapping` from matching interests
5. Papers matching no confirmed interest: classify as "mildly" if tangentially related, or skip if irrelevant

---

# Groups Database Schema

Maintain a CSV file (`groups_database.csv`) with these columns:

| Column | Description |
|--------|-------------|
| `group_name` | Display name of the group (e.g., "Safety & Verification"). Must match exactly the values used in `theme_groups`. |
| `status` | "confirmed" (shown on website), "suggested" (pending user review), or "rejected" (dismissed) |
| `description` | Short description of what papers belong in this group |
| `display_order` | Integer controlling the order groups appear on the website (lower = earlier) |
| `date_added` | Date this group was added |
| `notes` | Additional notes, e.g. what papers triggered a suggested group |

## Group Discovery Rules

During each run (Mode 1 or Mode 2), after assigning `theme_groups` to papers:

1. **Read `groups_database.csv`** at the start of Step 5 to get the current canonical confirmed list.
2. **If a paper fits no existing confirmed group** AND represents a genuinely new research area, create a new row in `groups_database.csv` with `status="suggested"`. Assign the suggested `group_name` to the paper's `theme_groups`.
3. **Skip rejected** — Never re-suggest a group that has `status="rejected"`.
4. **Threshold** — Only suggest a new group if it is clearly distinct from all confirmed groups and meaningfully describes 1+ papers in the current run.
5. **User review** — The website's Interests tab shows suggested groups with Approve/Dismiss buttons. Approved groups get `status="confirmed"` and appear in future runs. Dismissed groups get `status="rejected"`.

## How Groups Drive Display

Groups are purely a display layer — they are not used for filtering or ranking.

1. Read confirmed groups from `groups_database.csv`, sorted by `display_order`
2. For each paper, split `theme_groups` on `|` and fan into matching confirmed group cards
3. Papers whose groups are all rejected/suggested simply don't appear in any group card (acceptable)
4. The `Other` group catches papers that don't fit any specific group
