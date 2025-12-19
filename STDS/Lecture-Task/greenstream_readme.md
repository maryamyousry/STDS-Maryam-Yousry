# ⚡ GreenStream Energy - Serverless ETL Pipeline

> A production-grade serverless ETL pipeline for processing smart meter data from 50,000+ IoT devices, designed with event-driven architecture and comprehensive data quality controls.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Transformation Rules](#transformation-rules)
- [Data Lifecycle](#data-lifecycle)
- [Key Features](#key-features)
- [Design Principles](#design-principles)
- [Technology Stack](#technology-stack)
- [Getting Started](#getting-started)
- [Contributing](#contributing)

## 🎯 Overview

GreenStream Energy's Serverless ETL Pipeline is an enterprise-scale data processing system designed to handle real-time smart meter readings from residential and commercial installations. The system processes approximately 4.8 million readings daily, ensuring data quality, reliability, and scalability through modern cloud-native architecture patterns.

**Project Details:**
- **Date:** March 2024
- **Type:** System Architecture & Data Design
- **Scale:** 50,000+ Smart Meters
- **Processing Volume:** ~4.8M daily readings

## 🏗️ Architecture

### System Components

The pipeline follows a serverless, event-driven architecture with clear separation of concerns:

```
📊 DATA FLOW
│
├─ 📥 DATA SOURCE LAYER
│   └─ 50,000 Smart Meters (CSV Output)
│
├─ 💾 RAW DATA STORAGE
│   └─ Landing Zone (S3): /raw-data/YYYY-MM-DD/
│
├─ 🔄 ORCHESTRATION ENGINE
│   ├─ File Validation
│   └─ Routing Logic
│
├─ ⚙️ TRANSFORMATION LAYER
│   ├─ Extract & Parse
│   ├─ Clean & Standardize
│   ├─ Validate & Enrich
│   └─ Retry Logic (3x exponential backoff)
│
├─ 🗄️ STRUCTURED STORAGE (RDS)
│   ├─ meter_readings
│   ├─ meter_metadata
│   └─ data_quality_log
│
├─ 📊 ANALYTICS DATA LAKE
│   └─ Parquet Format (Snappy Compressed)
│       └─ Partition: /year=YYYY/month=MM/
│
└─ 📈 CONSUMPTION LAYER
    ├─ BI Dashboards
    ├─ ML Models
    └─ External APIs
```

### Error Handling

- **Error Queue:** Alerting & Monitoring for recoverable errors
- **Dead Letter Queue:** Failed records requiring manual review
- **Retry Strategy:** 3 attempts with exponential backoff (2s, 4s, 8s)

## 🔧 Transformation Rules

### Category 1: Unit Standardization

| Rule ID | Logic | Example |
|---------|-------|---------|
| **B1.1** | Convert W to kW (divide by 1000) | 2500 W → 2.5 kW |
| **B1.2** | Validate against allowlist: [W, kW, Watt, Kilowatt] | "Volts" → Error |
| **B1.3** | Round to 4 decimal places | 2.49999 → 2.5000 |

### Category 2: Missing Value Handling

| Rule ID | Logic | Rationale |
|---------|-------|-----------|
| **B2.1** | Flag NULL energy values as `MISSING_READING` | Maintains data lineage |
| **B2.2** | Infer timestamp from sequence (15-min intervals) | Recovers corrupted time-series |
| **B2.3** | Alert on >4 consecutive NULLs (>1 hour gap) | Detects connectivity issues |

### Category 3: Data Validation & Range Checks

| Rule ID | Logic & Action | Rationale |
|---------|----------------|-----------|
| **B3.1** | Check: `0 < consumption_kw < 50 kW` | Physical plausibility check |
| **B3.2** | Flag 0 kW for >24 consecutive hours | Detects dead meters or tampering |
| **B3.3** | Reject timestamps outside valid range | Prevents future data or clock reset dates |

### Category 4: Faulty Meter Detection

- **B4.1 - Stuck Meter:** Variance < 0.01 kW² over 24h window
- **B4.2 - Erratic Spike:** Reading > mean + (4 × std_dev) over 7-day rolling window
- **B4.3 - Communication Failure:** >20% missing readings over 7 days

### Category 5: Data Enrichment

**B5.1 - Peak Period Classification:**
- **Peak:** 17:00-21:00 (Weekdays)
- **Off-Peak:** 23:00-06:00
- **Standard:** All other times

**B5.2 - Seasonal Tagging:**
- Winter (Dec-Feb), Spring (Mar-May), Summer (Jun-Aug), Fall (Sep-Nov)

**B5.3 - Quality Scoring System:**
```
Starting Score: 0
+ 40 pts: No missing values
+ 30 pts: No validation errors
+ 20 pts: Within expected range
+ 10 pts: Meter reliability >95%

Grades: A (90-100) | B (75-89) | C (60-74) | F (<60)
```

### Category 6: Metadata Enhancement

- **B6.1 - Lineage:** Append `processed_timestamp`, `pipeline_version`, `source_file`
- **B6.2 - Idempotency:** Generate unique ID: `SHA256(meter_id + timestamp + energy_value)`

## 📦 Data Lifecycle

### Sample Record Journey

**Input Record:**
```
meter_id: SM-48291
timestamp: 2024-03-15 18:45:00
energy_value: 3250 W
location: Residential_Zone_7
```

### Processing Timeline

#### ⏱️ Phase 1: Ingestion (18:45:00 - 18:45:03)

1. **File Upload** - Meter transmits via Wi-Fi, batched into CSV
2. **Event Trigger** - S3 `NEW_FILE_CREATED` event fires
3. **Initial Validation** - File size, extension, duplicate check ✓

#### ⚙️ Phase 2: Transformation (18:45:04 - 18:45:05)

1. **Queue Pickup** - Worker downloads and parses CSV
2. **Business Rules Applied:**
   - ✅ 3250 W → 3.25 kW
   - ✅ Range validation passed
   - ✅ Peak period tagged
   - ✅ Spring season assigned
   - ✅ Record ID generated
3. **Quality Scoring** - Grade A (100/100)

#### 💾 Phase 3: Structured Storage (18:45:05 - 18:45:06)

1. Database transaction with idempotency check
2. INSERT into `meter_readings` table
3. COMMIT and message acknowledgment

#### 📊 Phase 4: Archival (Next Day 02:00 AM)

1. Scheduled aggregation of 4.8M daily readings
2. Parquet conversion with Snappy compression (~70% reduction)
3. Data lake upload: `/analytics/year=2024/month=03/region=Zone7/`

#### 📈 Phase 5: Consumption (Ongoing)

- **Immediate:** Operations dashboard visibility
- **Historical:** ML model training for peak demand forecasting

### 🚨 Failure Scenarios

| Scenario | Handling Strategy |
|----------|------------------|
| **Transformation Fails** | 3 retry attempts → Dead Letter Queue |
| **DB Write Fails** | Transaction rollback → Message requeued |
| **Duplicate File** | Idempotency key prevents duplicate entries |

## ✨ Key Features

### 🔐 Data Quality by Design
- Comprehensive validation rules at transformation stage
- Quality scoring system (A-F grading)
- Invalid data flagged, not dropped (preserves lineage)

### 🔄 Idempotency & Reliability
- SHA256-based unique record IDs
- `ON CONFLICT DO NOTHING` database constraints
- Graceful failure handling with retry logic

### 📈 Scalability Through Serverless
- Event-driven architecture (S3 + Lambda)
- Auto-scaling based on incoming file volume
- No server capacity management required

### 👁️ Observability
- Comprehensive logging at every stage
- Dead Letter Queues for failed records
- Real-time alerting and monitoring

### 🗂️ Separation of Concerns
- **Raw Storage:** Audit trail (90-day retention)
- **Structured DB:** Operational/real-time queries
- **Data Lake:** Analytics/batch processing (unlimited retention)

## 🛠️ Technology Stack

- **Cloud Platform:** AWS
- **Storage:** S3 (Raw), RDS (Structured), Data Lake (Parquet)
- **Compute:** Lambda Functions
- **Orchestration:** Event-driven triggers
- **Compression:** Snappy
- **Format:** CSV (input), Parquet (analytics)
- **Database:** Relational Database Service (RDS)

## 📊 Design Principles

1. **Separation of Concerns** - Distinct layers for different data velocities
2. **Idempotency** - Safe reprocessing without duplicates
3. **Data Quality First** - Validation and scoring at transformation
4. **Serverless Scalability** - Auto-scaling event-driven architecture
5. **Complete Observability** - Comprehensive logging and monitoring

## 📝 Documentation

- **Retention Policies:**
  - Raw Data (S3): 90 days
  - Structured Data (RDS): 90 days
  - Analytics Data Lake: Unlimited

- **Processing Schedule:**
  - Real-time: Event-driven (within seconds)
  - Batch Aggregation: Daily @ 02:00 AM

## 👤 Author

**Maryam Yousry**
- GitHub: [@maryamyousry](https://github.com/maryamyousry)

## 🙏 Acknowledgments

- GreenStream Energy Strategic Initiative
- Design Thinking for Data Scientists Framework
- AWS Serverless Architecture Best Practices