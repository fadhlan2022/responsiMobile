// Nama : Fadhlan Hisyam
// NIM  : 124200022
// Plug : A

class DetailMatchesModel {
  final String? id;
  final String? venue;
  final String? location;
  final String? status;
  final String? stageName;
  final String? time;
  final HomeTeamDetail? homeTeam;
  final AwayTeamDetail? awayTeam;
  final List<OfficialsDetail>? officials;
  final String? createdAt;
  final String? date;
  final String? updatedAt;
  final String? winner;

  DetailMatchesModel({
    this.id,
    this.venue,
    this.location,
    this.status,
    this.stageName,
    this.time,
    this.homeTeam,
    this.awayTeam,
    this.officials,
    this.createdAt,
    this.date,
    this.updatedAt,
    this.winner,
  });

  DetailMatchesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        venue = json['venue'] as String?,
        location = json['location'] as String?,
        status = json['status'] as String?,
        stageName = json['stageName'] as String?,
        time = json['time'] as String?,
        homeTeam = (json['homeTeam'] as Map<String,dynamic>?) != null ? HomeTeamDetail.fromJson(json['homeTeam'] as Map<String,dynamic>) : null,
        awayTeam = (json['awayTeam'] as Map<String,dynamic>?) != null ? AwayTeamDetail.fromJson(json['awayTeam'] as Map<String,dynamic>) : null,
        officials = (json['officials'] as List?)?.map((dynamic e) => OfficialsDetail.fromJson(e as Map<String,dynamic>)).toList(),
        createdAt = json['createdAt'] as String?,
        date = json['date'] as String?,
        updatedAt = json['updatedAt'] as String?,
        winner = json['winner'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'venue' : venue,
    'location' : location,
    'status' : status,
    'stageName' : stageName,
    'time' : time,
    'homeTeam' : homeTeam?.toJson(),
    'awayTeam' : awayTeam?.toJson(),
    'officials' : officials?.map((e) => e.toJson()).toList(),
    'createdAt' : createdAt,
    'date' : date,
    'updatedAt' : updatedAt,
    'winner' : winner
  };
}

class HomeTeamDetail {
  final String? country;
  final int? goals;
  final String? name;
  final int? penalties;
  final Statistics? statistics;
  final List<Substitutions>? substitutions;
  final List<StartingPlayers>? startingPlayers;

  HomeTeamDetail({
    this.country,
    this.goals,
    this.name,
    this.penalties,
    this.statistics,
    this.substitutions,
    this.startingPlayers,
  });

  HomeTeamDetail.fromJson(Map<String, dynamic> json)
      : country = json['country'] as String?,
        goals = json['goals'] as int?,
        name = json['name'] as String?,
        penalties = json['penalties'] as int?,
        statistics = (json['statistics'] as Map<String,dynamic>?) != null ? Statistics.fromJson(json['statistics'] as Map<String,dynamic>) : null,
        substitutions = (json['substitutions'] as List?)?.map((dynamic e) => Substitutions.fromJson(e as Map<String,dynamic>)).toList(),
        startingPlayers = (json['startingPlayers'] as List?)?.map((dynamic e) => StartingPlayers.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'country' : country,
    'goals' : goals,
    'name' : name,
    'penalties' : penalties,
    'statistics' : statistics?.toJson(),
    'substitutions' : substitutions?.map((e) => e.toJson()).toList(),
    'startingPlayers' : startingPlayers?.map((e) => e.toJson()).toList()
  };
}

class Statistics {
  final int? attemptsOnGoal;
  final int? kicksOnTarget;
  final int? kicksOffTarget;
  final int? kicksBlocked;
  final int? kicksOnWoodwork;
  final int? corners;
  final int? offsides;
  final double? ballPossession;
  final int? passes;
  final int? passesCompleted;
  final double? distanceCovered;
  final int? freeKicks;
  final int? crosses;
  final int? crossesCompleted;
  final int? assists;
  final int? yellowCards;
  final int? redCards;
  final int? foulsCommited;
  final int? foulsReceived;
  final String? tactics;

  Statistics({
    this.attemptsOnGoal,
    this.kicksOnTarget,
    this.kicksOffTarget,
    this.kicksBlocked,
    this.kicksOnWoodwork,
    this.corners,
    this.offsides,
    this.ballPossession,
    this.passes,
    this.passesCompleted,
    this.distanceCovered,
    this.freeKicks,
    this.crosses,
    this.crossesCompleted,
    this.assists,
    this.yellowCards,
    this.redCards,
    this.foulsCommited,
    this.foulsReceived,
    this.tactics,
  });

  Statistics.fromJson(Map<String, dynamic> json)
      : attemptsOnGoal = json['attemptsOnGoal'] as int?,
        kicksOnTarget = json['kicksOnTarget'] as int?,
        kicksOffTarget = json['kicksOffTarget'] as int?,
        kicksBlocked = json['kicksBlocked'] as int?,
        kicksOnWoodwork = json['kicksOnWoodwork'] as int?,
        corners = json['corners'] as int?,
        offsides = json['offsides'] as int?,
        ballPossession = json['ballPossession'] as double?,
        passes = json['passes'] as int?,
        passesCompleted = json['passesCompleted'] as int?,
        distanceCovered = json['distanceCovered'] as double?,
        freeKicks = json['freeKicks'] as int?,
        crosses = json['crosses'] as int?,
        crossesCompleted = json['crossesCompleted'] as int?,
        assists = json['assists'] as int?,
        yellowCards = json['yellowCards'] as int?,
        redCards = json['redCards'] as int?,
        foulsCommited = json['foulsCommited'] as int?,
        foulsReceived = json['foulsReceived'] as int?,
        tactics = json['tactics'] as String?;

  Map<String, dynamic> toJson() => {
    'attemptsOnGoal' : attemptsOnGoal,
    'kicksOnTarget' : kicksOnTarget,
    'kicksOffTarget' : kicksOffTarget,
    'kicksBlocked' : kicksBlocked,
    'kicksOnWoodwork' : kicksOnWoodwork,
    'corners' : corners,
    'offsides' : offsides,
    'ballPossession' : ballPossession,
    'passes' : passes,
    'passesCompleted' : passesCompleted,
    'distanceCovered' : distanceCovered,
    'freeKicks' : freeKicks,
    'crosses' : crosses,
    'crossesCompleted' : crossesCompleted,
    'assists' : assists,
    'yellowCards' : yellowCards,
    'redCards' : redCards,
    'foulsCommited' : foulsCommited,
    'foulsReceived' : foulsReceived,
    'tactics' : tactics
  };
}

class Substitutions {
  final String? minute;
  final PlayerIn? playerIn;
  final PlayerOut? playerOut;

  Substitutions({
    this.minute,
    this.playerIn,
    this.playerOut,
  });

  Substitutions.fromJson(Map<String, dynamic> json)
      : minute = json['minute'] as String?,
        playerIn = (json['playerIn'] as Map<String,dynamic>?) != null ? PlayerIn.fromJson(json['playerIn'] as Map<String,dynamic>) : null,
        playerOut = (json['playerOut'] as Map<String,dynamic>?) != null ? PlayerOut.fromJson(json['playerOut'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'minute' : minute,
    'playerIn' : playerIn?.toJson(),
    'playerOut' : playerOut?.toJson()
  };
}

class PlayerIn {
  final String? name;
  final int? number;
  final String? position;

  PlayerIn({
    this.name,
    this.number,
    this.position,
  });

  PlayerIn.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        number = json['number'] as int?,
        position = json['position'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'number' : number,
    'position' : position
  };
}

class PlayerOut {
  final String? name;
  final int? number;
  final String? position;

  PlayerOut({
    this.name,
    this.number,
    this.position,
  });

  PlayerOut.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        number = json['number'] as int?,
        position = json['position'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'number' : number,
    'position' : position
  };
}

class StartingPlayers {
  final String? name;
  final int? number;
  final String? position;

  StartingPlayers({
    this.name,
    this.number,
    this.position,
  });

  StartingPlayers.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        number = json['number'] as int?,
        position = json['position'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'number' : number,
    'position' : position
  };
}

class AwayTeamDetail {
  final String? country;
  final int? goals;
  final String? name;
  final int? penalties;
  final Statistics? statistics;
  final List<Substitutions>? substitutions;
  final List<StartingPlayers>? startingPlayers;

  AwayTeamDetail({
    this.country,
    this.goals,
    this.name,
    this.penalties,
    this.statistics,
    this.substitutions,
    this.startingPlayers,
  });

  AwayTeamDetail.fromJson(Map<String, dynamic> json)
      : country = json['country'] as String?,
        goals = json['goals'] as int?,
        name = json['name'] as String?,
        penalties = json['penalties'] as int?,
        statistics = (json['statistics'] as Map<String,dynamic>?) != null ? Statistics.fromJson(json['statistics'] as Map<String,dynamic>) : null,
        substitutions = (json['substitutions'] as List?)?.map((dynamic e) => Substitutions.fromJson(e as Map<String,dynamic>)).toList(),
        startingPlayers = (json['startingPlayers'] as List?)?.map((dynamic e) => StartingPlayers.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'country' : country,
    'goals' : goals,
    'name' : name,
    'penalties' : penalties,
    'statistics' : statistics?.toJson(),
    'substitutions' : substitutions?.map((e) => e.toJson()).toList(),
    'startingPlayers' : startingPlayers?.map((e) => e.toJson()).toList()
  };
}

class StatisticsAway {
  final int? attemptsOnGoal;
  final int? kicksOnTarget;
  final int? kicksOffTarget;
  final int? kicksBlocked;
  final int? kicksOnWoodwork;
  final int? corners;
  final int? offsides;
  final double? ballPossession;
  final int? passes;
  final int? passesCompleted;
  final double? distanceCovered;
  final int? freeKicks;
  final int? crosses;
  final int? crossesCompleted;
  final int? assists;
  final int? yellowCards;
  final int? redCards;
  final int? foulsCommited;
  final int? foulsReceived;
  final String? tactics;

  StatisticsAway({
    this.attemptsOnGoal,
    this.kicksOnTarget,
    this.kicksOffTarget,
    this.kicksBlocked,
    this.kicksOnWoodwork,
    this.corners,
    this.offsides,
    this.ballPossession,
    this.passes,
    this.passesCompleted,
    this.distanceCovered,
    this.freeKicks,
    this.crosses,
    this.crossesCompleted,
    this.assists,
    this.yellowCards,
    this.redCards,
    this.foulsCommited,
    this.foulsReceived,
    this.tactics,
  });

  StatisticsAway.fromJson(Map<String, dynamic> json)
      : attemptsOnGoal = json['attemptsOnGoal'] as int?,
        kicksOnTarget = json['kicksOnTarget'] as int?,
        kicksOffTarget = json['kicksOffTarget'] as int?,
        kicksBlocked = json['kicksBlocked'] as int?,
        kicksOnWoodwork = json['kicksOnWoodwork'] as int?,
        corners = json['corners'] as int?,
        offsides = json['offsides'] as int?,
        ballPossession = json['ballPossession'] as double?,
        passes = json['passes'] as int?,
        passesCompleted = json['passesCompleted'] as int?,
        distanceCovered = json['distanceCovered'] as double?,
        freeKicks = json['freeKicks'] as int?,
        crosses = json['crosses'] as int?,
        crossesCompleted = json['crossesCompleted'] as int?,
        assists = json['assists'] as int?,
        yellowCards = json['yellowCards'] as int?,
        redCards = json['redCards'] as int?,
        foulsCommited = json['foulsCommited'] as int?,
        foulsReceived = json['foulsReceived'] as int?,
        tactics = json['tactics'] as String?;

  Map<String, dynamic> toJson() => {
    'attemptsOnGoal' : attemptsOnGoal,
    'kicksOnTarget' : kicksOnTarget,
    'kicksOffTarget' : kicksOffTarget,
    'kicksBlocked' : kicksBlocked,
    'kicksOnWoodwork' : kicksOnWoodwork,
    'corners' : corners,
    'offsides' : offsides,
    'ballPossession' : ballPossession,
    'passes' : passes,
    'passesCompleted' : passesCompleted,
    'distanceCovered' : distanceCovered,
    'freeKicks' : freeKicks,
    'crosses' : crosses,
    'crossesCompleted' : crossesCompleted,
    'assists' : assists,
    'yellowCards' : yellowCards,
    'redCards' : redCards,
    'foulsCommited' : foulsCommited,
    'foulsReceived' : foulsReceived,
    'tactics' : tactics
  };
}

class SubstitutionsAway {
  final String? minute;
  final PlayerIn? playerIn;
  final PlayerOut? playerOut;

  SubstitutionsAway({
    this.minute,
    this.playerIn,
    this.playerOut,
  });

  SubstitutionsAway.fromJson(Map<String, dynamic> json)
      : minute = json['minute'] as String?,
        playerIn = (json['playerIn'] as Map<String,dynamic>?) != null ? PlayerIn.fromJson(json['playerIn'] as Map<String,dynamic>) : null,
        playerOut = (json['playerOut'] as Map<String,dynamic>?) != null ? PlayerOut.fromJson(json['playerOut'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'minute' : minute,
    'playerIn' : playerIn?.toJson(),
    'playerOut' : playerOut?.toJson()
  };
}

class PlayerInAway {
  final String? name;
  final int? number;
  final String? position;

  PlayerInAway({
    this.name,
    this.number,
    this.position,
  });

  PlayerInAway.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        number = json['number'] as int?,
        position = json['position'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'number' : number,
    'position' : position
  };
}

class PlayerOutAway {
  final String? name;
  final int? number;
  final String? position;

  PlayerOutAway({
    this.name,
    this.number,
    this.position,
  });

  PlayerOutAway.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        number = json['number'] as int?,
        position = json['position'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'number' : number,
    'position' : position
  };
}

class StartingPlayersAway {
  final String? name;
  final int? number;
  final String? position;

  StartingPlayersAway({
    this.name,
    this.number,
    this.position,
  });

  StartingPlayersAway.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        number = json['number'] as int?,
        position = json['position'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'number' : number,
    'position' : position
  };
}

class OfficialsDetail {
  final String? name;
  final String? role;
  final String? country;

  OfficialsDetail({
    this.name,
    this.role,
    this.country,
  });

  OfficialsDetail.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        role = json['role'] as String?,
        country = json['country'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'role' : role,
    'country' : country
  };
}