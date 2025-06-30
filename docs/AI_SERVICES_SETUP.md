# AI Services Setup Guide

This guide provides comprehensive instructions for setting up and configuring all 20 AI services integrated into the REChain application.

## Table of Contents

1. [Overview](#overview)
2. [Quick Start](#quick-start)
3. [Service Configuration](#service-configuration)
4. [API Keys Setup](#api-keys-setup)
5. [Usage Examples](#usage-examples)
6. [Troubleshooting](#troubleshooting)
7. [Cost Management](#cost-management)
8. [Security Best Practices](#security-best-practices)

## Overview

The REChain application integrates 20 top AI and GPT services, providing a unified interface for:

- **Text Generation**: ChatGPT, Claude, Gemini, and more
- **Image Generation**: DALL-E, Midjourney, Stability AI
- **Code Generation**: Specialized coding assistants
- **Content Creation**: Marketing and writing tools
- **Analytics**: Usage tracking and cost management

## Quick Start

### 1. Access AI Services Dashboard

1. Open the REChain application
2. Navigate to the main dashboard
3. Click on the "AI Services" tab
4. You'll see the AI Services Dashboard with 4 tabs:
   - **Chat**: Text generation and conversations
   - **Image**: Image generation
   - **Code**: Code generation
   - **Analytics**: Usage statistics

### 2. Configure Your First Service

1. Click the "Settings" icon in the top-right corner
2. Select a service (e.g., OpenAI)
3. Enter your API key
4. Enable the service
5. Save the configuration

### 3. Generate Your First Response

1. Select a service from the dropdown
2. Enter a prompt in the text field
3. Click "Generate Text"
4. View the response in the results list

## Service Configuration

### Core AI Services

#### 1. OpenAI
- **API Key**: Get from [OpenAI Platform](https://platform.openai.com/api-keys)
- **Base URL**: `https://api.openai.com/v1`
- **Models**: GPT-4, GPT-3.5-turbo, DALL-E-3
- **Cost**: $0.03-0.06 per 1K tokens (GPT-4)

```json
{
  "api_key": "sk-your-openai-key",
  "base_url": "https://api.openai.com/v1",
  "organization": "org-your-org-id",
  "enabled": true,
  "default_model": "gpt-4",
  "max_tokens": 1000,
  "temperature": 0.7
}
```

#### 2. Anthropic (Claude)
- **API Key**: Get from [Anthropic Console](https://console.anthropic.com/)
- **Base URL**: `https://api.anthropic.com/v1`
- **Models**: Claude-3-Opus, Claude-3-Sonnet, Claude-3-Haiku
- **Cost**: $0.003-0.075 per 1K tokens

```json
{
  "api_key": "sk-ant-your-anthropic-key",
  "base_url": "https://api.anthropic.com/v1",
  "enabled": true,
  "default_model": "claude-3-sonnet-20240229",
  "max_tokens": 1000,
  "temperature": 0.7
}
```

#### 3. Google AI (Gemini)
- **API Key**: Get from [Google AI Studio](https://makersuite.google.com/app/apikey)
- **Base URL**: `https://generativelanguage.googleapis.com/v1beta`
- **Models**: Gemini Pro, Gemini Pro Vision
- **Cost**: $0.0005 per 1K tokens

```json
{
  "api_key": "your-google-ai-key",
  "base_url": "https://generativelanguage.googleapis.com/v1beta",
  "enabled": true,
  "default_model": "gemini-pro",
  "max_tokens": 1000,
  "temperature": 0.7
}
```

#### 4. Azure OpenAI
- **API Key**: Get from [Azure Portal](https://portal.azure.com/)
- **Endpoint**: Your Azure OpenAI endpoint
- **Models**: GPT-4, GPT-3.5-turbo, DALL-E-3
- **Cost**: Varies by Azure pricing

```json
{
  "api_key": "your-azure-api-key",
  "endpoint": "https://your-resource.openai.azure.com/",
  "deployment_name": "gpt-4",
  "api_version": "2024-02-15-preview",
  "enabled": true,
  "default_model": "gpt-4",
  "max_tokens": 1000,
  "temperature": 0.7
}
```

### Image Generation Services

#### 5. DALL-E
- **API Key**: Same as OpenAI
- **Models**: DALL-E-3, DALL-E-2
- **Cost**: $0.04 per image (DALL-E-3)

```json
{
  "api_key": "sk-your-openai-key",
  "base_url": "https://api.openai.com/v1",
  "enabled": true,
  "default_model": "dall-e-3",
  "size": "1024x1024",
  "quality": "standard"
}
```

#### 6. Midjourney
- **API Key**: Get from [Midjourney](https://www.midjourney.com/)
- **Models**: v6
- **Cost**: $0.10 per image

```json
{
  "api_key": "your-midjourney-key",
  "base_url": "https://api.midjourney.com/v1",
  "enabled": true,
  "default_model": "v6",
  "aspect_ratio": "1:1",
  "quality": "standard"
}
```

#### 7. Stability AI
- **API Key**: Get from [Stability AI](https://platform.stability.ai/)
- **Models**: Stable Diffusion XL, Stable Diffusion v1.6
- **Cost**: $0.02 per image

```json
{
  "api_key": "your-stability-key",
  "base_url": "https://api.stability.ai/v1",
  "enabled": true,
  "default_model": "stable-diffusion-xl-1024-v1-0",
  "steps": 30,
  "cfg_scale": 7.0
}
```

### Specialized Services

#### 8. Cohere
- **API Key**: Get from [Cohere](https://cohere.com/)
- **Models**: Command, Command-Light
- **Cost**: $0.0015-0.002 per 1K tokens

#### 9. Hugging Face
- **API Key**: Get from [Hugging Face](https://huggingface.co/settings/tokens)
- **Models**: Various open-source models
- **Cost**: Free tier available

#### 10. Replicate
- **API Key**: Get from [Replicate](https://replicate.com/)
- **Models**: Various open-source models
- **Cost**: Pay-per-use

### Content Creation Services

#### 11. Jasper
- **API Key**: Get from [Jasper](https://www.jasper.ai/)
- **Models**: Various content templates
- **Cost**: Subscription-based

#### 12. Copy.ai
- **API Key**: Get from [Copy.ai](https://www.copy.ai/)
- **Models**: Marketing content templates
- **Cost**: Subscription-based

#### 13. Writesonic
- **API Key**: Get from [Writesonic](https://writesonic.com/)
- **Models**: Content generation templates
- **Cost**: Subscription-based

### Chat and Conversation Services

#### 14. Perplexity
- **API Key**: Get from [Perplexity](https://www.perplexity.ai/)
- **Models**: PPLX-70B-Online
- **Cost**: Pay-per-use

#### 15. You.com
- **API Key**: Get from [You.com](https://you.com/)
- **Models**: You Model
- **Cost**: Pay-per-use

#### 16. Phind
- **API Key**: Get from [Phind](https://www.phind.com/)
- **Models**: Phind Model
- **Cost**: Pay-per-use

#### 17. Poe
- **API Key**: Get from [Poe](https://poe.com/)
- **Models**: Various AI models
- **Cost**: Pay-per-use

#### 18. Character.AI
- **API Key**: Get from [Character.AI](https://character.ai/)
- **Models**: Character models
- **Cost**: Pay-per-use

### Additional Services

#### 19. Claude (Standalone)
- **API Key**: Same as Anthropic
- **Models**: Claude models
- **Cost**: Same as Anthropic

#### 20. Bard (Standalone)
- **API Key**: Same as Google AI
- **Models**: Gemini models
- **Cost**: Same as Google AI

#### 21. Etke.cc
- **API Key**: Get from [Etke.cc](https://etke.cc/)
- **Base URL**: `https://api.etke.cc/v1`
- **Models**: 
  - Text: etke-gpt-4, etke-gpt-3.5, etke-claude
  - Code: etke-coder, etke-debugger, etke-optimizer
  - Image: etke-dalle, etke-stable-diffusion
  - Analysis: etke-analyzer, etke-insights
- **Cost**: $0.002-0.004 per 1K tokens, $0.02-0.04 per image

```json
{
  "api_key": "your-etke-api-key",
  "base_url": "https://api.etke.cc/v1",
  "enabled": true,
  "default_model": "etke-gpt-4",
  "max_tokens": 2000,
  "temperature": 0.7
}
```

**Special Features:**
- **Code Analysis**: Comprehensive code review and security analysis
- **Code Debugging**: AI-powered debugging with explanations
- **Code Optimization**: Performance and efficiency improvements
- **Insights Generation**: AI-powered insights and recommendations
- **Multi-language Support**: Support for multiple programming languages

## API Keys Setup

### Getting API Keys

1. **OpenAI**: Visit [platform.openai.com](https://platform.openai.com/api-keys)
2. **Anthropic**: Visit [console.anthropic.com](https://console.anthropic.com/)
3. **Google AI**: Visit [makersuite.google.com](https://makersuite.google.com/app/apikey)
4. **Azure OpenAI**: Visit [portal.azure.com](https://portal.azure.com/)
5. **Other Services**: Follow the links provided above

### Security Best Practices

1. **Never share your API keys**
2. **Use environment variables in production**
3. **Rotate keys regularly**
4. **Monitor usage and costs**
5. **Set up billing alerts**

### Configuration Storage

API keys are stored securely in the app's local storage. For production deployments:

1. Use secure key management systems
2. Implement proper encryption
3. Follow your organization's security policies
4. Consider using proxy services for additional security

## Usage Examples

### Text Generation

```dart
// Generate text with OpenAI
final responses = await aiManager.generateTextMultiService(
  prompt: "Explain quantum computing in simple terms",
  services: ['OpenAI', 'Claude'],
  parameters: {
    'max_tokens': 500,
    'temperature': 0.7,
  },
);
```

### Image Generation

```dart
// Generate image with DALL-E
final responses = await aiManager.generateImageMultiService(
  prompt: "A futuristic cityscape at sunset",
  services: ['DALL-E'],
  parameters: {
    'size': '1024x1024',
    'quality': 'standard',
  },
);
```

### Code Generation

```dart
// Generate code with multiple services
final responses = await aiManager.generateCodeMultiService(
  prompt: "Create a Flutter widget for a login form",
  language: 'dart',
  services: ['OpenAI', 'Claude', 'Phind'],
  parameters: {
    'max_tokens': 1000,
    'temperature': 0.3,
  },
);
```

### Content Creation

```dart
// Generate marketing content
final responses = await aiManager.generateContentMultiService(
  prompt: "Write a blog post about blockchain technology",
  contentType: 'article',
  services: ['Jasper', 'Copy AI', 'Writesonic'],
  parameters: {
    'tone': 'professional',
    'length': 'medium',
  },
);
```

## Troubleshooting

### Common Issues

1. **API Key Invalid**
   - Verify the API key is correct
   - Check if the key has expired
   - Ensure the key has proper permissions

2. **Service Unavailable**
   - Check your internet connection
   - Verify the service is enabled
   - Check the service's status page

3. **Rate Limiting**
   - Reduce request frequency
   - Upgrade your service plan
   - Use multiple services to distribute load

4. **High Costs**
   - Monitor usage in the Analytics tab
   - Set up billing alerts
   - Use more cost-effective models

### Error Messages

- **"Invalid API Key"**: Check your API key configuration
- **"Service Unavailable"**: The service may be down or your key is invalid
- **"Rate Limited"**: Too many requests, wait and try again
- **"Insufficient Credits"**: Add credits to your account

## Cost Management

### Cost Tracking

The Analytics tab provides:
- Total requests per service
- Cost per service
- Token usage
- Cost trends over time

### Cost Optimization

1. **Use appropriate models**: Choose cheaper models for simple tasks
2. **Optimize prompts**: Shorter, more specific prompts use fewer tokens
3. **Batch requests**: Combine multiple requests when possible
4. **Monitor usage**: Set up alerts for high usage

### Billing Alerts

Set up alerts for:
- Daily spending limits
- Monthly spending limits
- Unusual usage patterns
- Service-specific limits

## Security Best Practices

### API Key Security

1. **Never commit keys to version control**
2. **Use environment variables**
3. **Implement key rotation**
4. **Monitor for unauthorized usage**

### Data Privacy

1. **Review service privacy policies**
2. **Avoid sending sensitive data**
3. **Use local processing when possible**
4. **Implement data retention policies**

### Access Control

1. **Limit access to AI services**
2. **Implement user authentication**
3. **Log all API usage**
4. **Regular security audits**

## Support

For additional support:

1. **Documentation**: Check this guide and inline help
2. **Community**: Join our Discord/Telegram channels
3. **Issues**: Report bugs through GitHub issues
4. **Feature Requests**: Submit through GitHub discussions

## Updates

This guide is regularly updated with:
- New service integrations
- Configuration changes
- Best practices
- Troubleshooting tips

Check the changelog for the latest updates. 