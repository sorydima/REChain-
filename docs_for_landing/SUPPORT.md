ocs_for_landing/SUPPORT.md</path>
<parameter name="content"># REChain Support

Get help with REChain. We're here to support you!

## Support Options

| Option | Best For | Response Time |
|--------|----------|---------------|
| **Documentation** | Self-service help | Immediate |
| **Community** | General questions | 24 hours |
| **Email** | Private inquiries | 48 hours |
| **Enterprise** | Paid customers | 4 hours |
| **Emergency** | Security incidents | 1 hour |

## Documentation

### Self-Service Resources

**Quick Links:**
- [Getting Started](GETTING_STARTED.md) - New user guide
- [Features](FEATURES.md) - Feature overview
- [Security](SECURITY.md) - Security information
- [FAQ](FAQ.md) - Common questions

**Advanced Guides:**
- [Deployment Guide](docs/DEPLOYMENT_COMPREHENSIVE.md) - Server setup
- [API Reference](docs/API_REFERENCE.md) - Developer docs
- [Troubleshooting](docs/TROUBLESHOOTING_GUIDE.md) - Problem solving

**Developer Resources:**
- [GitHub](https://github.com/sorydima/REChain-)
- [API Documentation](docs/API.md)
- [Contributing Guide](docs/CONTRIBUTING.md)

## Community Support

### Matrix Community

Join our Matrix community for peer support:

**Primary Room:**
- Room: `#rechain:rechain.network`
- Link: [https://matrix.to/#/#rechain:rechain.network](https://matrix.to/#/#rechain:rechain.network)

**Community Rooms:**
- `#rechain-users:rechain.network` - General discussion
- `#rechain-support:rechain.network` - Get help
- `#rechain-development:rechain.network` - Development chat
- `#rechain-offtopic:rechain.network` - Off-topic chat

**Guidelines:**
- Be respectful
- Search before asking
- Provide context
- Be patient

### GitHub Issues

Report bugs and request features:

**Bug Reports:**
1. Search existing issues
2. Create new issue
3. Use bug report template
4. Include:
   - REChain version
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Logs (if applicable)

**Feature Requests:**
1. Search existing requests
2. Create new issue
3. Use feature request template
4. Include:
   - Description
   - Use case
   - Benefits
   - Alternatives considered

**Repository:** [github.com/sorydima/REChain-/issues](https://github.com/sorydima/REChain-/issues)

## Email Support

### General Inquiries

**Email:** support@rechain.network

**Include:**
- Your name
- Issue description
- REChain version
- Steps to reproduce
- Screenshots (if applicable)

### Sales Inquiries

**Email:** sales@rechain.network

**Topics:**
- Enterprise pricing
- Custom deployments
- Partnership opportunities
- Licensing

### Security Issues

**Email:** security@rechain.network

**Topics:**
- Report vulnerabilities
- Security concerns
- Incident response
- Compliance questions

## Enterprise Support

### Support Tiers

| Feature | Community | Pro | Enterprise |
|---------|-----------|-----|------------|
| Email Support | No | Yes | Yes |
| Response Time | 48 hours | 24 hours | 4 hours |
| Priority | Low | Medium | High |
| Dedicated Channel | No | No | Yes |
| Phone Support | No | No | Yes |
| SLA | No | 99.9% | 99.99% |
| Custom Development | No | No | Yes |
| Onboarding | No | Limited | Full |
| Training | No | Documentation | Sessions |
| Account Manager | No | No | Yes |

### Contact Enterprise Sales

**Email:** enterprise@rechain.network

**Include:**
- Company name
- Number of users
- Deployment type (cloud/self-hosted)
- Specific requirements

### Enterprise SLAs

| Metric | Pro | Enterprise |
|--------|-----|------------|
| Uptime | 99.9% | 99.99% |
| Support Response | 24 hours | 4 hours |
| Critical Response | 4 hours | 1 hour |
| Maintenance Window | 8 hours | 2 hours |
| Planned Downtime | 4 hours/month | 1 hour/month |

## Troubleshooting

### Common Issues

#### Can't Connect to Server

**Check:**
1. Server URL is correct
2. Internet connection works
3. Server is running
4. Firewall allows port 8008

**Try:**
```bash
# Test server connection
curl https://your-server.com/_matrix/client/versions
```

#### Login Failed

**Check:**
1. Username/password correct
2. Account exists
3. Server allows registration

**Try:**
1. Reset password
2. Clear app cache
3. Try different device

#### Messages Not Syncing

**Check:**
1. Internet connection
2. Server status
3. App version

**Try:**
1. Force sync (pull down)
2. Restart app
3. Check for updates

#### Encryption Issues

**Check:**
1. Device verified
2. Keys backed up
3. Session established

**Try:**
1. Re-verify device
2. Re-login
3. Reset E2E keys (last resort)

### Diagnostic Tools

**Health Check:**
```bash
curl http://localhost:8009/health
```

**Version Check:**
```bash
curl http://localhost:8008/_matrix/client/versions
```

**Log Analysis:**
```bash
journalctl -u rechain -n 100
```

## Feedback

### Report a Problem

1. Check existing reports
2. Gather information:
   - REChain version
   - Operating system
   - App version
   - Steps to reproduce
3. Create GitHub issue
4. Include logs if relevant

### Request a Feature

1. Search existing requests
2. Describe your use case
3. Explain the benefit
4. Consider alternatives
5. Vote on similar requests

### Contribute

We welcome contributions!

**Ways to Contribute:**
- Report bugs
- Fix bugs
- Add features
- Improve documentation
- Translate
- Test pull requests

**Getting Started:**
1. Fork repository
2. Create branch
3. Make changes
4. Submit pull request
5. Address feedback

**Guidelines:**
- Follow code style
- Add tests
- Update documentation
- Sign commits

**See Also:** [CONTRIBUTING.md](docs/CONTRIBUTING.md)

## Status

### System Status

Check our status page for uptime information:

**Status Page:** [status.rechain.network](https://status.rechain.network)

**Subscribe to Updates:**
- Email notifications
- RSS feed
- Slack integration

### Planned Maintenance

We announce maintenance in advance:

1. Posted on status page
2. Emailed to admins
3. Posted in Matrix community
4. Typically scheduled during off-peak hours

### Incident Reports

If there's an outage:

1. Status page updated
2. Incident severity posted
3. Updates every 30 minutes
4. Post-incident report within 48 hours

## Additional Resources

### External Links

| Resource | URL |
|----------|-----|
| Main Website | https://rechain.network |
| Documentation | https://docs.rechain.network |
| GitHub | https://github.com/sorydima/REChain- |
| Matrix | https://matrix.org |
| Element (Client) | https://element.io |

### Related Projects

| Project | Description |
|---------|-------------|
| Matrix | Protocol specification |
| Element | Reference client |
| Synapse | Reference server |
| Dendrite | Go server implementation |

### Community Resources

| Resource | Description |
|----------|-------------|
| Matrix FAQ | matrix.org/faq |
| Matrix Blog | matrix.org/blog |
| Element Guide | element.io/help |
| Awesome Matrix | github.com/awesome-matrix/awesome-matrix |

---

## Contact Us

| Need | Contact |
|------|---------|
| General support | support@rechain.network |
| Sales | sales@rechain.network |
| Enterprise | enterprise@rechain.network |
| Security | security@rechain.network |
| Community | #rechain:rechain.network |

---

**We value your feedback!** Help us improve REChain by sharing your experience.

**See Also**: [Getting Started](GETTING_STARTED.md) | [Features](FEATURES.md) | [Security](SECURITY.md)
