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
