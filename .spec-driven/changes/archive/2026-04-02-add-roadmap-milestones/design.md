# Design: add-roadmap-milestones

## Approach

Introduce roadmap support as a new persistent planning layer under
`.spec-driven/` rather than as a new execution system. The implementation should
add a managed roadmap scaffold:

```text
.spec-driven/
├── roadmap/
│   ├── INDEX.md
│   └── milestones/
│       └── <milestone>.md
├── specs/
└── changes/
```

The roadmap layer stays intentionally thin:
- `INDEX.md` summarizes the roadmap and points to milestone files
- Each milestone file carries the stage goal, done criteria, candidate ideas,
  planned changes, dependencies, risks, and derived status
- Approved execution work still happens as normal changes under `changes/`

The three roadmap skills divide responsibilities cleanly:
1. `spec-driven-roadmap-plan` establishes or reshapes the roadmap and milestone
   boundaries
2. `spec-driven-roadmap-milestone` edits one milestone in detail without turning
   the roadmap into a single monolith
3. `spec-driven-roadmap-sync` reads active/archive changes and updates roadmap
   state so long-term planning stays aligned with repository reality

The implementation should update `scripts/spec-driven.ts` so `init` creates or
repairs roadmap scaffold files, mirror that scaffold in `template/`, ship the
new skills through `install.sh`, and document the roadmap layer in the README.

## Key Decisions

- Use milestone files as the primary roadmap unit instead of a single
  repository-wide roadmap document. This keeps each stage bounded and readable.
- Store roadmap as a formal asset under `.spec-driven/roadmap/` so it survives
  chat sessions and can evolve with the repository.
- Keep `Candidate Ideas` separate from `Planned Changes` inside each milestone.
  That lets the roadmap capture future possibilities without conflating them
  with approved execution work.
- Derive milestone completion from archived planned changes only. This prevents
  roadmap progress from drifting away from the actual implementation history.
- Keep roadmap behavior in planning skills rather than adding a broader roadmap
  command surface immediately. The first version should validate the model before
  introducing more CLI mechanics.

## Alternatives Considered

- A single `roadmap.md` file at `.spec-driven/roadmap.md`. Rejected because it
  would become a high-churn document with mixed horizons and weak stage
  boundaries.
- Manual milestone completion flags. Rejected because they let roadmap state say
  "done" even when listed work has not actually been archived.
- Treat roadmap items as normal changes only, with no separate roadmap asset.
  Rejected because it does not preserve long-term goals, candidate ideas, or
  milestone-level sequencing.
- Introduce dedicated roadmap CLI subcommands first. Rejected because the first
  release only needs `init` scaffold support; the planning behavior belongs in
  skills.
