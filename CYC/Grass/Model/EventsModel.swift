//
//  EventsModel.swift
//  CYC
//
//  Created by 이민영 on 2023/12/12.
//

import Foundation

// MARK: - Event
struct Event: Decodable {
    let id: String
    let type: String // EventType 대신 String으로 타입 변경
    let repo: EventRepo
    let payload: Payload
    let createdAt: String // Date 대신 String으로 타입 변경

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case repo
        case payload
        case createdAt = "created_at" // JSON의 날짜 형식에 따라 맞춰 변경
    }
}

struct EventRepo: Decodable {
    let id: Int
    let name: String
    let url: String
}

struct Payload: Decodable {
    let commits: [Commit]?
    let number: Int?
}


// MARK: - Commit
struct Commit: Decodable {
    let sha: String
    let message: String
    let distinct: Bool
    let url: String
}

// MARK: - PullRequest
struct PullRequest: Decodable {
    let url: String
    let id: Int
    let createdAt: String // Date 대신 String으로 타입 변경
    let updatedAt: String // Date 대신 String으로 타입 변경
//    let closedAt: String? // Date 대신 String으로 타입 변경
//    let mergedAt: String? // Date 대신 String으로 타입 변경
    let commitsURL: String
    let reviewCommentsURL: String
    let commits: Int
    let additions: Int
    let deletions: Int
    let changedFiles: Int

    enum CodingKeys: String, CodingKey {
        case url
        case id
        case createdAt = "created_at" // JSON의 날짜 형식에 따라 맞춰 변경
        case updatedAt = "updated_at" // JSON의 날짜 형식에 따라 맞춰 변경
//        case closedAt = "closed_at" // JSON의 날짜 형식에 따라 맞춰 변경
//        case mergedAt = "merged_at" // JSON의 날짜 형식에 따라 맞춰 변경
        case commitsURL = "commits_url"
        case reviewCommentsURL = "review_comments_url"
        case commits
        case additions
        case deletions
        case changedFiles = "changed_files"
    }
}

enum EventType: String {
    case pullRequestEvent = "PullRequestEvent"
    case pushEvent = "PushEvent"
}
