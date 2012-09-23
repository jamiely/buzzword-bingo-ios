//
//  JALBingoGame.m
//  BuzzwordBingo
//
//  Created by Jamie Ly on 16/09/2012.
//  Copyright (c) 2012 Jamie Ly. All rights reserved.
//

#import "JALBingoGame.h"
#import "JALDirectionPole.h"
#import "MACollectionUtilities.h"

@interface JALBingoGame() {
    NSArray *bingoExceptionChecks;
    NSArray *exceptionPositions;
}
@end

@implementation JALBingoGame

@synthesize board;
@synthesize history;
@synthesize wordList;
@synthesize isBingo;

-(id) init {
    self = [super init];
    if(self) {
        history = [[JALHistory alloc] init];
    }
    return self;
}

-(id) initWithWordList: (WordList*) list {
    self = [self init];
    if(self) {
        board = [[JALBoard alloc] initWithWordList: list];
        bingoExceptionChecks = @[
            @[[board topLeft], [JALDirection SouthEast]],
            @[[board topRight], [JALDirection SouthWest]],
            @[[board bottomLeft], [JALDirection NorthEast]],
            @[[board bottomRight], [JALDirection NorthWest]]
        ];
        exceptionPositions = [bingoExceptionChecks ma_map:^id(NSArray *exc) {
            return [exc objectAtIndex: 0];
        }];
        wordList = list;
    }
    return self;
}

-(BOOL) playWord: (NSString*) word {
    [history addToHistory: word];
    if([board markWord: word]) {
        [self checkBingoAtPosition: [board positionOfWord: word]];
        return YES;
    }
    return NO;
}

-(NSArray*) playedWords {
    return [history words];
}

-(NSArray*) markedWords {
    return [board markedWords];
}

-(void) checkBingoAtPosition: (JALPosition*) pos {
    if(isBingo) return;
    NSUInteger maxSteps = MAX(board.cols, board.rows);
    if([self checkBingoAtPosition: pos onPole: [JALDirectionPole NS] withMaxSteps: board.rows]) {
        isBingo = YES;
        NSLog(@"Vertical bingo");
    }
    else if([self checkBingoAtPosition: pos onPole: [JALDirectionPole EW] withMaxSteps: board.cols]) {
        isBingo = YES;
        NSLog(@"Horizontal Bingo");
    }
    // a diagonal match can only happen when the absolute value of the row and column
    // match (at least on the default board size)
    else if(abs(pos.row) == abs(pos.col)) {
        isBingo = [self checkBingoAtPosition: pos onPole: [JALDirectionPole NESW] withMaxSteps: maxSteps] ||
        [self checkBingoAtPosition: pos onPole: [JALDirectionPole NWSE] withMaxSteps: maxSteps];
        if(isBingo) {
            NSLog(@"Diagonal Bingo");
        }
    }
}

-(BOOL) isPositionException: (JALPosition*) pos {
    BOOL __block is_exception = NO;
    [exceptionPositions enumerateObjectsUsingBlock:^(JALPosition* eachPos, NSUInteger idx, BOOL *stop) {
        if([pos isEqual: eachPos]) {
            is_exception = YES;
            (*stop) = YES;
        }
    }];
    return is_exception;
}

-(BOOL) checkBingoAtPosition: (JALPosition*) pos onPole: (JALDirectionPole*) pole withMaxSteps: (NSUInteger) steps {

    // handle exceptions first
    if([JALDirectionPole isDiagonal: pole]) {
        for(NSInteger i = 0, c = bingoExceptionChecks.count; i < c; i++) {
            NSArray* exc = [bingoExceptionChecks objectAtIndex: i];
            JALPosition *eachPos = [exc objectAtIndex: 0];
            if([pos isEqual: eachPos]) {
                JALDirection *dir = [exc objectAtIndex: 1];
                return [self isMarkedAtPosition:pos inDirection:dir withSteps:steps];
            }
        }
    }

    return [self isMarkedAtPosition: pos inDirection: pole.a withSteps: steps] &&
        [self isMarkedAtPosition: pos inDirection: pole.b withSteps: steps];
}

-(BOOL) isMarkedAtPosition: (JALPosition*) pos
               inDirection: (JALDirection*) direction
                 withSteps: (NSUInteger) steps {
    if(steps == 0) return YES;
    // position is unbounded if nil or if the board test fails
    if(!pos || ![board isPositionBounded: pos]) return YES;
    if(![board isMarkedAtPosition: pos]) return NO;
    
    JALPosition *newPosition = [direction adjustPosition: pos];
    return [self isMarkedAtPosition: newPosition inDirection: direction withSteps: steps - 1];
    
}

- (NSArray*) boardWords {
    return board.words;
}

@end
