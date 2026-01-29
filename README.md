# 06-tipjar - Base Native Architecture

> **Built for the Base Superchain & Stacks Bitcoin L2**

This project is architected to be **Base-native**: prioritizing onchain identity, low-latency interactions, and indexer-friendly data structures.

## 🔵 Base Native Features
- **Smart Account Ready**: Compatible with ERC-4337 patterns.
- **Identity Integrated**: Designed to resolve Basenames and store social metadata.
- **Gas Optimized**: Uses custom errors and batched call patterns for L2 efficiency.
- **Indexer Friendly**: Emits rich, indexed events for Subgraph data availability.

## 🟠 Stacks Integration
- **Bitcoin Security**: Leverages Proof-of-Transfer (PoX) via Clarity contracts.
- **Post-Condition Security**: Strict asset movement checks.

---
# TipJar

Creator tipping platform with message attachments on Base and Stacks.

## Features

- Send tips with messages
- Track tip history
- Creator withdrawals
- Balance management

## Contract Functions

### Base (Solidity)
- `sendTip(creator, message)` - Send tip with message
- `withdraw()` - Withdraw balance
- `getBalance(creator)` - Check balance
- `getTips(creator)` - Get tip history

### Stacks (Clarity)
- `send-tip` - Send STX tip with message
- `withdraw` - Withdraw earnings
- `get-balance` - Check balance

## Quick Start

```bash
pnpm install
pnpm dev
```

## Deploy

```bash
pnpm deploy:base
pnpm deploy:stacks
```

## License

MIT
